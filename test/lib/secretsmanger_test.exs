defmodule ExAws.SecretsManagerTest do
  use ExUnit.Case, async: true

  alias ExAws.Operation.JSON
  alias ExAws.SecretsManager

  test "Cancel Rotating Secret" do
    assert %JSON{
             before_request: nil,
             data: %{"SecretId" => "secret-id"},
             headers: [
               {"x-amz-target", "secretsmanager.CancelRotateSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.cancel_rotate_secret("secret-id")
  end

  test "Create Secret" do
    assert %JSON{
             before_request: nil,
             data: %{},
             headers: [
               {"x-amz-target", "secretsmanager.CreateSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.create_secret()
  end

  test "Delete Secret" do
    assert %JSON{
             before_request: nil,
             data: %{"RecoveryWindowInDays" => 5, "SecretId" => "secret-id"},
             headers: [
               {"x-amz-target", "secretsmanager.DeleteSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.delete_secret("secret-id", [
               {:recovery_window_in_days, 5}
             ])
  end

  test "Describe Secret" do
    assert %JSON{
             before_request: nil,
             data: %{"SecretId" => "secret-id"},
             headers: [
               {"x-amz-target", "secretsmanager.DescribeSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.describe_secret("secret-id")
  end

  test "Get Random Password" do
    assert %JSON{
             before_request: nil,
             data: %{},
             headers: [
               {"x-amz-target", "secretsmanager.GetRandomPassword"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.get_random_password()
  end

  test "Get Secret Value" do
    assert %JSON{
             before_request: nil,
             data: %{
               "SecretId" => "secret-id",
               "VersionId" => "foo",
               "VersionStage" => "bar"
             },
             headers: [
               {"x-amz-target", "secretsmanager.GetSecretValue"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.get_secret_value("secret-id", [
               {:version_id, "foo"},
               {:version_stage, "bar"}
             ])
  end

  test "List Secrets" do
    assert %JSON{
             before_request: nil,
             data: %{"MaxResults" => 5, "NextToken" => "foo"},
             headers: [
               {"x-amz-target", "secretsmanager.ListSecrets"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.list_secrets([
               {:max_results, 5},
               {:next_token, "foo"}
             ])
  end

  test "List Secret Version Ids" do
    assert %JSON{
             before_request: nil,
             data: %{
               "IncludeDeprecated" => true,
               "MaxResults" => 5,
               "NextToken" => "foo",
               "SecretId" => "secret-id"
             },
             headers: [
               {"x-amz-target", "secretsmanager.ListSecretVersionIds"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.list_secret_version_ids("secret-id", [
               {:include_deprecated, true},
               {:max_results, 5},
               {:next_token, "foo"}
             ])
  end

  test "Put Secret Value" do
    assert %JSON{
             before_request: nil,
             data: %{
               "ClientRequestToken" => "token",
               "SecretBinary" => "binary",
               "SecretId" => "secret-id",
               "SecretString" => "string",
               "VersionStages" => ["stage1", "stage2"]
             },
             headers: [
               {"x-amz-target", "secretsmanager.PutSecretValue"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.put_secret_value("secret-id", [
               {:client_request_token, "token"},
               {:secret_binary, "binary"},
               {:secret_string, "string"},
               {
                 :version_stages,
                 ["stage1", "stage2"]
               }
             ])
  end

  test "Restore Secret" do
    assert %JSON{
             before_request: nil,
             data: %{"SecretId" => "secret-id"},
             headers: [
               {"x-amz-target", "secretsmanager.RestoreSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.restore_secret("secret-id")
  end

  test "Rotate Secret" do
    assert %JSON{
             before_request: nil,
             data: %{
               "ClientRequestToken" => "token",
               "RotationLambdaArn" => "rotation lambda",
               "RotationRules" => [automatically_after_days: 3],
               "SecretId" => "secret-id"
             },
             headers: [
               {"x-amz-target", "secretsmanager.RotateSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.rotate_secret("secret-id", [
               {:client_request_token, "token"},
               {:rotation_lambda_arn, "rotation lambda"},
               {:rotation_rules, [{:automatically_after_days, 3}]}
             ])
  end

  test "Tag Resource" do
    assert %JSON{
             before_request: nil,
             data: %{
               "SecretId" => "secret-id",
               "Tags" => [
                 %{"Key" => "key1", "Value" => "value1"},
                 %{"Key" => "key2", "Value" => "value2"}
               ]
             },
             headers: [
               {"x-amz-target", "secretsmanager.TagResource"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.tag_resource("secret-id", [
               [{:key, "key1"}, {:value, "value1"}],
               [{:key, "key2"}, {:value, "value2"}]
             ])
  end

  test "Untag Resource" do
    assert %JSON{
             before_request: nil,
             data: %{"SecretId" => "secret-id", "TagKeys" => ["key1", "key2"]},
             headers: [
               {"x-amz-target", "secretsmanager.UntagResource"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } = SecretsManager.untag_resource("secret-id", ["key1", "key2"])
  end

  test "Update Secret" do
    assert %JSON{
             before_request: nil,
             data: %{
               "ClientRequestToken" => "token",
               "Description" => "description",
               "KmsKeyId" => "kms key",
               "SecretBinary" => "binary",
               "SecretId" => "secret-id",
               "SecretString" => "string"
             },
             headers: [
               {"x-amz-target", "secretsmanager.UpdateSecret"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.update_secret("secret-id", [
               {:client_request_token, "token"},
               {:description, "description"},
               {:kms_key_id, "kms key"},
               {:secret_binary, "binary"},
               {:secret_string, "string"}
             ])
  end

  test "Update Secret Version Stage" do
    assert %JSON{
             before_request: nil,
             data: %{
               "MoveToVersionId" => "version",
               "RemoveFromVersionId" => "remove",
               "SecretId" => "secret-id",
               "VersionStage" => "stage"
             },
             headers: [
               {"x-amz-target", "secretsmanager.UpdateSecretVersionStage"},
               {"content-type", "application/x-amz-json-1.1"}
             ],
             http_method: :post,
             parser: _,
             path: "/",
             service: :secretsmanager,
             stream_builder: nil
           } =
             SecretsManager.update_secret_version_stage("secret-id", [
               {:move_to_version_id, "version"},
               {:remove_from_version_id, "remove"},
               {:version_stage, "stage"}
             ])
  end
end
