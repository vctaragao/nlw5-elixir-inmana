defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    prepare_name(name) |> build_return_message_by_age(prepare_age(age)) |> return_message()
  end

  defp prepare_name(name), do: String.trim(name) |> String.downcase()

  defp prepare_age(age) when is_bitstring(age), do: String.to_integer(age)

  defp prepare_age(age), do: age

  defp build_return_message_by_age("mochileiro", 42) do
    "Bem vindo mochileiro, senior. Agora vá descobrir a pergunta"
  end

  defp build_return_message_by_age("mochileiro", age) when age >= 18 do
    "Bem vindo mochileiro, agora vá descobrir a resposta"
  end

  defp build_return_message_by_age(name, _age) do
    {:error, "Desculpe, mas vc não é bem vindo #{name}"}
  end

  defp return_message({:error, message}), do: {:error, message}

  defp return_message(message), do: {:ok, message}
end
