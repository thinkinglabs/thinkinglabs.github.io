---
layout: article
title: Testable IAM Policy documents
author: Thierry de Pauw
---

The one thing I love about Pulumi, is its testability and ability to run fast,
real unit tests locally without needing the cloud. That was a relief. The one
thing that is disappointing is it misses a proper API for manipulating AWS IAM
Policy documents.

Policy documents are assigned using JSON objects that should follow the AWS
IAM JSON policy syntax. But there is no validation. It is perfectly possible to
pass an invalid IAM Policy document. You will only be noticed the minute you
apply it to the AWS cloud. That is a quite long feedback loop incurring a
non-neglectable amount of wait time.

To avoid this, I prefer to write my policies as Policy as Code. It avoids
common syntax errors. Therefore it reduces the feedback cycle. And increases
your delivery throughput.

Having to pass a JSON as policy document was a bit disappointing.

Add to that I work in the financial industry. Compliance is kind of important.
So, I was in search for something to easily unit test IAM Policy documents,
preferably at the Statement level. That would help us to adhere to the required
security requirements.

Before reinventing the wheel, I looked around for what already existed in the
JavaScript world for manipulating IAM Policy documents.

Pulumi has the
[`aws.iam.getPolicyDocument`](https://www.pulumi.com/docs/reference/pkg/aws/iam/getpolicydocument/)
API. That looked interesting. It allows to write the policies as Policy as Code.
But to unit test the IAM Policy Document, you have to mock the function call
`aws.iam.getPolicyDocument`. Huh. That is not really helpful.

I dug further to see what Node.js packages has to offer for manipulating IAM
Policy documents. Not much. Except for
[AWS CDK](https://docs.aws.amazon.com/cdk/api/latest/typescript/api/aws-iam.html).
But then you drag the whole CDK Node.js package into your project just to handle
IAM Policy documents. However, AWS CDK was a good basis for designing
[@thinkinglabs/aws-iam-policy](https://www.npmjs.com/package/@thinkinglabs/aws-iam-policy).

## A simple identity-based policy

Let's look at the code example for `aws.iam.Policy` provided by Pulumi.

```typescript
import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";

const policy = new aws.iam.Policy("policy", {
    description: "My test policy",
    policy: JSON.stringify({
        Version: "2012-10-17",
        Statement: [{
            Action: ["ec2:Describe*"],
            Effect: "Allow",
            Resource: "*",
        }],
    }),
});
```

Using `@thinkinglabs/aws-iam-policy` that would look like this.

```typescript
import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import {PolicyDocument, Statement} from "@thinkinglabs/aws-iam-policy";

export const policy = new aws.iam.Policy("policy", {
    description: "My test policy",
    policy: grantEC2Describe(),
});

function grantEC2Describe() {
  return new PolicyDocument([
    new Statement({
      effect: "Allow",
      actions: ["ec2:Describe*"],
      resources: ["*"],
    }),
  ]).json
}
```

Now we would like to test if our IAM Policy is a valid identity-based IAM
Policy. For that we can use `PolicyDocument.validateForIdentityPolicy()` which
returns an array of `string` error messages. If it returns an empty array, the
IAM Policy is valid.

```typescript
import {expect} from "chai";
import "./mocks";
import * as pulumi from '@pulumi/pulumi';
import {PolicyDocument, Statement} from '@thinkinglabs/aws-iam-policy';

import * as sut from "../src/index";

const get = <T>(output: pulumi.Output<T> | undefined): Promise<T | undefined> | undefined =>
  output ? (output as any).promise() as Promise<T> : undefined;

describe("IAM Policy", function() {

  it('should be a valid identity-based policy', async () => {
    const doc = await get(sut.policy.policy) as string
    const policy = PolicyDocument.fromJson(doc);

    expect(policy.validateForIdentityPolicy()).to.be.empty;
  });
});
```

## A more complicated resource-based policy

Being regulated requires from us that we control closely who has access to what.
And that we do not inadvertently grant a right to someone that could be painful.
Let's say, the ability to delete a bucket or have access to confidential
information stored in an S3 Bucket.

Therefore, we always define S3 Bucket policies with several statements granting
admin access to administrators and usage access to users and denying delete
bucket rights for everyone.

To simplify and make unit tests more documenting, we wanted to be able to test
an individual statement. `@thinkinglabs/aws-iam-policy` provides the ability
to retrieve a single Statement by `Sid` if one was provided.

```typescript
const statement = policy.getStatement("MyFancySID");
```

Let's create an S3 Bucket with a Bucket Policy having multiple Statements.

```typescript
import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import {PolicyDocument, Statement, AnonymousUserPrincipal, RootAccountPrincipal} from "@thinkinglabs/aws-iam-policy";

const bucket = new aws.s3.Bucket("bucket", {acl: "private"});
const bucketPolicy = new aws.s3.BucketPolicy("bucketPolicy", {
  bucket: bucket.id,
  policy: createS3BucketPolicy("0123456789012", bucket, [adminRole], [userRole]),
});

function createAssumeRolePolicy() {
  return new PolicyDocument([
    new Statement({
      effect: "Allow",
      principals: [new RootAccountPrincipal("123412341234")],
      actions: ["sts:AssumeRole"],
    }),
  ]).json;
}

export function createS3BucketPolicy(
    accountId: string,
    bucket: aws.s3.Bucket,
    bucketAdmins: aws.iam.Role[],
    bucketUsers: aws.iam.Role[],
) {
  return pulumi.all([
    bucket.arn,
    bucketAdmins.map((role) => role.uniqueId),
    bucketUsers.map((role) => role.uniqueId)
  ]).apply(([bucketArn, bucketAdminUniqueIds, bucketUserUniqueIds]) => {
      return new PolicyDocument([
        new Statement({
          sid: "Allow access for Bucket Administrators",
          effect: "Deny",
          principals: [new AnonymousUserPrincipal()],
          actions: [
            "s3:PutBucketPolicy",
            "s3:GetBucketPolicy*",
            "s3:DeleteBucketPolicy",
          ],
          resources: [bucketArn],
          conditions: {
            StringNotLike: {
              "aws:userId": [accountId]
                  .concat(bucketAdminUniqueIds.map((uniqueId) => `${uniqueId}:*`)),
            },
          },
        }),
        new Statement({
          sid: "Allow use of the bucket",
          effect: "Deny",
          principals: [new AnonymousUserPrincipal()],
          actions: ["s3:ListBucket*", "s3:Get*", "s3:PutObject*", "s3:DeleteObject*"],
          resources: [bucketArn, `${bucketArn}/*`],
          conditions: {
            StringNotLike: {
              "aws:userId": [accountId]
                  .concat(bucketAdminUniqueIds.map((uniqueId) => `${uniqueId}:*`))
                  .concat(bucketUserUniqueIds.map((uniqueId) => `${uniqueId}:*`)),
            },
          },
        }),
        new Statement({
          sid: "Deny delete bucket",
          effect: "Deny",
          principals: [new AnonymousUserPrincipal()],
          actions: ["s3:DeleteBucket"],
          resources: [bucketArn],
        })],
      ).json;
  });
}
```

A test to check if the S3 Bucket Policy allows access for bucket administrators
would look like this.

```typescript
import {expect} from "chai";
import "./mocks";
import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import {PolicyDocument, Statement, AnonymousUserPrincipal} from "@thinkinglabs/aws-iam-policy";

describe("S3 Bucket Policy", function() {
  const accountId = "123456789012";
  const bucket = new aws.s3.Bucket("a-bucket", {});
  const adminRole = new aws.iam.Role("admin-role", {
    assumeRolePolicy: "aPolicy",
  });
  const userRole = new aws.iam.Role("user-role", {
    assumeRolePolicy: "aPolicy",
  });

  const doc = sut.createS3BucketPolicy(accountId, bucket, [adminRole], [userRole]);

  let policy: PolicyDocument;
  before(async () => {
    policy = PolicyDocument.fromJson(await get(doc) as string);
  });

  it("should allow access for Bucket Administrators", function() {
    const statement = policy.getStatement("Allow access for Bucket Administrators");
    expect(statement).to.deep.equal(new Statement({
      actions: [
        "s3:PutBucketPolicy",
        "s3:GetBucketPolicy*",
        "s3:DeleteBucketPolicy",
      ],
      effect: "Deny",
      principals: [new AnonymousUserPrincipal()],
      resources: ["a-bucket-arn"],
      conditions: {
        StringNotLike: {"aws:userId": ["123456789012", "admin-role-unique-id:*"]},
      },
      sid: "Allow access for Bucket Administrators",
    }));
  });

});
```

For this test we need to create some fake IAM Roles. This is achieved by
including the `mocks` module.

```typescript
import * as pulumi from '@pulumi/pulumi';

pulumi.runtime.setMocks({
  newResource: function(args: pulumi.runtime.MockResourceArgs): { id: string, state: Record<string, any>} {
    const defaultState = {
      arn: `${args.name}-arn`,
      name: args.name,
      ...args.inputs,
    };
    switch (args.type) {
      case 'aws:iam/role:Role':
        defaultState['uniqueId'] = `${args.name}-unique-id`;
        break;
      default:
        break;
    }

    const resourceId = args.id?.trim() ? args.id : `${args.name}-id`;

    return {id: resourceId, state: defaultState};
  },
  call: function(args: pulumi.runtime.MockCallArgs) {
    switch (args.token) {
    }
    return args.inputs;
  },
});
```

## Limitations

Because of laziness from my side, there is no object model for `Condition`,
neither support for `NotPrincipal`, `NotAction` and `NotResource`.

At the moment, `Condition` accept any JSON object. This is planned for version
2.0.
