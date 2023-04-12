provider "aws" {
    region = "us-east-1" 
}

resource "aws_iam_user" "myUser" {
    name = "TJ"
}

resource "aws_iam_policy" "customPolicy" {
    name = "GlacierEFSEC2"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "ec2:CreateIpamPool",
                "ec2:ResetInstanceAttribute",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:ModifyVpnConnectionOptions",
                "ec2:ReleaseIpamPoolAllocation",
                "ec2:CreateCoipPoolPermission",
                "ec2:DeleteNetworkInsightsAnalysis",
                "ec2:UnassignPrivateIpAddresses",
                "glacier:PurchaseProvisionedCapacity",
                "ec2:DisableImageDeprecation",
                "ec2:DeleteLocalGatewayRouteTable",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:CancelCapacityReservationFleets",
                "ec2:CreateVerifiedAccessEndpoint",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:ModifyInstanceMaintenanceOptions",
                "ec2:DeleteNatGateway",
                "ec2:CancelCapacityReservation",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "glacier:ListVaults",
                "ec2:ModifyVpcEndpoint",
                "ec2:ModifyInstanceCapacityReservationAttributes",
                "ec2:CreatePublicIpv4Pool",
                "ec2:ResetFpgaImageAttribute"
            ],
            "Resource": "*"
        }
    ]
}
EOF 
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "attachment"
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_iam_policy.customPolicy.arn
}