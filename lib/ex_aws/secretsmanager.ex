defmodule ExAws.SecretsManager do
  @moduledoc """
  Operations on AWS Secrets Manager
  """

  import ExAws.Utils

  alias ExAws.Operation.JSON

  @doc "Cancel rotating a secret"
  @spec cancel_rotate_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  def cancel_rotate_secret(secret_id) do
    query_params = %{
      "SecretId" => secret_id
    }

    request(:cancel_rotate_secret, query_params)
  end

  @doc "Create a new secret"
  @spec create_secret() :: ExAws.Operation.JSON.t()
  @spec create_secret(opts :: Keyword.t()) :: ExAws.Operation.JSON.t()
  def create_secret(opts \\ []) do
    query_params =
      opts
      |> normalize_opts

    request(:create_secret, query_params)
  end

  @doc "Delete a secret"
  @type delete_secret_opts :: [{:recovery_window_in_days, integer}]
  @spec delete_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec delete_secret(secret_id :: binary, opts :: delete_secret_opts) ::
          ExAws.Operation.JSON.t()
  def delete_secret(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:delete_secret, query_params)
  end

  @doc "Describe a secret"
  @spec describe_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  def describe_secret(secret_id) do
    query_params = %{
      "SecretId" => secret_id
    }

    request(:describe_secret, query_params)
  end

  @doc "Get random password"
  @spec get_random_password() :: ExAws.Operation.JSON.t()
  @spec get_random_password(opts :: Keyword.t()) :: ExAws.Operation.JSON.t()
  def get_random_password(opts \\ []) do
    query_params =
      opts
      |> normalize_opts

    request(:get_random_password, query_params)
  end

  @doc "Get value of secret"
  @type get_secret_value_opts :: [
          {:version_id, binary}
          | {:version_stage, binary}
        ]
  @spec get_secret_value(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec get_secret_value(secret_id :: binary, opts :: get_secret_value_opts) ::
          ExAws.Operation.JSON.t()
  def get_secret_value(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:get_secret_value, query_params)
  end

  @doc "List all secrets"
  @type list_secrets_opts :: [
          {:max_results, integer} | {:next_token, binary}
        ]
  @spec list_secrets() :: ExAws.Operation.JSON.t()
  @spec list_secrets(opts :: list_secrets_opts) :: ExAws.Operation.JSON.t()
  def list_secrets(opts \\ []) do
    query_params =
      opts
      |> normalize_opts

    request(:list_secrets, query_params)
  end

  @doc "List all versions of a secret"
  @type list_secret_version_ids_opts :: [
          {:include_deprecated, boolean}
          | {:max_results, integer}
          | {:next_token, binary}
        ]
  @spec list_secret_version_ids(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec list_secret_version_ids(
          secret_id :: binary,
          opts :: list_secret_version_ids_opts
        ) :: ExAws.Operation.JSON.t()
  def list_secret_version_ids(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:list_secret_version_ids, query_params)
  end

  @doc "Puts a new encrypted value in a secret"
  @type put_secret_value_opts :: [
          {:client_request_token, binary}
          | {:secret_binary, binary}
          | {:secret_string, binary}
          | {:version_stages, list(binary)}
        ]
  @spec put_secret_value(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec put_secret_value(
          secret_id :: binary,
          opts :: put_secret_value_opts
        ) :: ExAws.Operation.JSON.t()
  def put_secret_value(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:put_secret_value, query_params)
  end

  @doc "Restore a deleted secret"
  @spec restore_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  def restore_secret(secret_id) do
    query_params = %{
      "SecretId" => secret_id
    }

    request(:restore_secret, query_params)
  end

  @doc "Configure rotating a secret"
  @type rotation_rules :: [{:automatically_after_days, integer}]
  @type rotate_secret_opts :: [
          {:client_request_token, binary}
          | {:rotation_lambda_arn, binary}
          | {:rotation_rules, rotation_rules}
        ]
  @spec rotate_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec rotate_secret(secret_id :: binary, opts :: rotate_secret_opts) ::
          ExAws.Operation.JSON.t()
  def rotate_secret(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:rotate_secret, query_params)
  end

  @doc "Attach a tag to a secret"
  @type tag :: [{:key, binary} | {:value, binary}]
  @spec tag_resource(secret_id :: binary, tags :: list(tag)) ::
          ExAws.Operation.JSON.t()
  def tag_resource(secret_id, tags) do
    normalized_tags = tags |> Enum.map(&normalize_opts/1)

    query_params = %{
      "SecretId" => secret_id,
      "Tags" => normalized_tags
    }

    request(:tag_resource, query_params)
  end

  @doc "Remove tags from a secret"
  @spec untag_resource(secret_id :: binary, tag_keys :: list(binary)) ::
          ExAws.Operation.JSON.t()
  def untag_resource(secret_id, tag_keys) do
    query_params = %{
      "SecretId" => secret_id,
      "TagKeys" => tag_keys
    }

    request(:untag_resource, query_params)
  end

  @doc "Update details of a secret"
  @type update_secret_opts :: [
          {:client_request_token, binary}
          | {:description, binary}
          | {:kms_key_id, binary}
          | {:secret_binary, binary}
          | {:secret_string, binary}
        ]
  @spec update_secret(secret_id :: binary) :: ExAws.Operation.JSON.t()
  @spec update_secret(secret_id :: binary, opts :: update_secret_opts) ::
          ExAws.Operation.JSON.t()
  def update_secret(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:update_secret, query_params)
  end

  @doc "Modify the staging labels attached to a version of a secret"
  @type update_secret_version_stage_opts :: [
          {:move_to_version_id, binary}
          | {:remove_from_version_id, binary}
          | {:version_stage, binary}
        ]
  @spec update_secret_version_stage(secret_id :: binary) ::
          ExAws.Operation.JSON.t()
  @spec update_secret_version_stage(
          secret_id :: binary,
          opts :: update_secret_version_stage_opts
        ) :: ExAws.Operation.JSON.t()
  def update_secret_version_stage(secret_id, opts \\ []) do
    query_params =
      opts
      |> normalize_opts
      |> Map.merge(%{
        "SecretId" => secret_id
      })

    request(:update_secret_version_stage, query_params)
  end

  defp request(action, params, opts \\ %{}) do
    operation =
      action
      |> Atom.to_string()
      |> Macro.camelize()

    JSON.new(
      :secretsmanager,
      %{
        data: params,
        headers: [
          {"x-amz-target", "secretsmanager.#{operation}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end

  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys
  end
end
