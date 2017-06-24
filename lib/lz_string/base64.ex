defmodule LZString.Base64 do
  def base64_to_bitstring(65), do: << 0 :: size(6) >>
  def base64_to_bitstring(66), do: << 1 :: size(6) >>
  def base64_to_bitstring(67), do: << 2 :: size(6) >>
  def base64_to_bitstring(68), do: << 3 :: size(6) >>
  def base64_to_bitstring(69), do: << 4 :: size(6) >>
  def base64_to_bitstring(70), do: << 5 :: size(6) >>
  def base64_to_bitstring(71), do: << 6 :: size(6) >>
  def base64_to_bitstring(72), do: << 7 :: size(6) >>
  def base64_to_bitstring(73), do: << 8 :: size(6) >>
  def base64_to_bitstring(74), do: << 9 :: size(6) >>
  def base64_to_bitstring(75), do: << 10 :: size(6) >>
  def base64_to_bitstring(76), do: << 11 :: size(6) >>
  def base64_to_bitstring(77), do: << 12 :: size(6) >>
  def base64_to_bitstring(78), do: << 13 :: size(6) >>
  def base64_to_bitstring(79), do: << 14 :: size(6) >>
  def base64_to_bitstring(80), do: << 15 :: size(6) >>
  def base64_to_bitstring(81), do: << 16 :: size(6) >>
  def base64_to_bitstring(82), do: << 17 :: size(6) >>
  def base64_to_bitstring(83), do: << 18 :: size(6) >>
  def base64_to_bitstring(84), do: << 19 :: size(6) >>
  def base64_to_bitstring(85), do: << 20 :: size(6) >>
  def base64_to_bitstring(86), do: << 21 :: size(6) >>
  def base64_to_bitstring(87), do: << 22 :: size(6) >>
  def base64_to_bitstring(88), do: << 23 :: size(6) >>
  def base64_to_bitstring(89), do: << 24 :: size(6) >>
  def base64_to_bitstring(90), do: << 25 :: size(6) >>
  def base64_to_bitstring(97), do: << 26 :: size(6) >>
  def base64_to_bitstring(98), do: << 27 :: size(6) >>
  def base64_to_bitstring(99), do: << 28 :: size(6) >>
  def base64_to_bitstring(100), do: << 29 :: size(6) >>
  def base64_to_bitstring(101), do: << 30 :: size(6) >>
  def base64_to_bitstring(102), do: << 31 :: size(6) >>
  def base64_to_bitstring(103), do: << 32 :: size(6) >>
  def base64_to_bitstring(104), do: << 33 :: size(6) >>
  def base64_to_bitstring(105), do: << 34 :: size(6) >>
  def base64_to_bitstring(106), do: << 35 :: size(6) >>
  def base64_to_bitstring(107), do: << 36 :: size(6) >>
  def base64_to_bitstring(108), do: << 37 :: size(6) >>
  def base64_to_bitstring(109), do: << 38 :: size(6) >>
  def base64_to_bitstring(110), do: << 39 :: size(6) >>
  def base64_to_bitstring(111), do: << 40 :: size(6) >>
  def base64_to_bitstring(112), do: << 41 :: size(6) >>
  def base64_to_bitstring(113), do: << 42 :: size(6) >>
  def base64_to_bitstring(114), do: << 43 :: size(6) >>
  def base64_to_bitstring(115), do: << 44 :: size(6) >>
  def base64_to_bitstring(116), do: << 45 :: size(6) >>
  def base64_to_bitstring(117), do: << 46 :: size(6) >>
  def base64_to_bitstring(118), do: << 47 :: size(6) >>
  def base64_to_bitstring(119), do: << 48 :: size(6) >>
  def base64_to_bitstring(120), do: << 49 :: size(6) >>
  def base64_to_bitstring(121), do: << 50 :: size(6) >>
  def base64_to_bitstring(122), do: << 51 :: size(6) >>
  def base64_to_bitstring(48), do: << 52 :: size(6) >>
  def base64_to_bitstring(49), do: << 53 :: size(6) >>
  def base64_to_bitstring(50), do: << 54 :: size(6) >>
  def base64_to_bitstring(51), do: << 55 :: size(6) >>
  def base64_to_bitstring(52), do: << 56 :: size(6) >>
  def base64_to_bitstring(53), do: << 57 :: size(6) >>
  def base64_to_bitstring(54), do: << 58 :: size(6) >>
  def base64_to_bitstring(55), do: << 59 :: size(6) >>
  def base64_to_bitstring(56), do: << 60 :: size(6) >>
  def base64_to_bitstring(57), do: << 61 :: size(6) >>
  def base64_to_bitstring(43), do: << 62 :: size(6) >>
  def base64_to_bitstring(47), do: << 63 :: size(6) >>
  def base64_to_bitstring(61), do: << 64 :: size(6) >>
  def base64_to_bitstring(c), do: IO.inspect ~s'unexpected character #{c} #{<<c :: utf8>>}'

  defmacro __using__(_env) do
    quote do
      @doc ~S"""
      Compresses the given string and base64 encodes it.

          iex> LZString.compress_base64("hello, i am a 猫")
          "BYUwNmD2A0AECWsCGBbZtDUzkAA="
      """
      def compress_base64(str) do
        str |> compress |> Base.encode64
      end

      @doc ~S"""
      Decompresses the given string after decoding lz-string's non-standard base64.

          iex> LZString.decompress_base64("BYUwNmD2A0AECWsCGBbZtDUzkA==")
          "hello, i am a 猫"
      """
      def decompress_base64(str) do
        str |> decode_base64 |> decompress
      end


      @doc ~S"""
      Decodes the given "base64" string, giving a naked lz-string bitstring.

      iex> LZString.decode_base64("BYUwNmD2A0AECWsCGBbZtDUzkA==")
      <<5, 133, 48, 54, 96, 246, 3, 64, 4, 9, 107, 2, 24, 22, 217, 180, 53, 51, 144, 0, 0>>
      """
      def decode_base64(str) do
        for << c :: utf8 <- str >>, into: <<>> do
          LZString.Base64.base64_to_bitstring(c)
        end
      end

      @doc ~S"""
      Compresses the given string and base64 encodes it, substituting uri-unsafe characters.

      iex> LZString.compress_uri_encoded("hello, i am a 猫")
      "BYUwNmD2A0AECWsCGBbZtDUzkAA$"
      """
      def compress_uri_encoded(str) do
        str
        |> compress_base64
        |> String.replace("/", "-")
        |> String.replace("=", "$")
      end

      @doc ~S"""
      Decompresses the given "uri encoded" base64 compressed string.

      iex> LZString.decompress_uri_encoded("BYUwNmD2A0AECWsCGBbZtDUzkAA$")
      "hello, i am a 猫"
      """
      def decompress_uri_encoded(str) do
        str
        |> String.replace("-", "/")
        |> String.replace("$", "=")
        |> decompress_base64
      end

      @doc ~S"""
      Decodes the given "uri encoded" base64 string, giving a naked lz-string bitstring.

      iex> LZString.decode_uri_encoded("BYUwNmD2A0AECWsCGBbZtDUzkA$$")
      <<5, 133, 48, 54, 96, 246, 3, 64, 4, 9, 107, 2, 24, 22, 217, 180, 53, 51, 144, 0, 0>>
      """
      def decode_uri_encoded(str) do
        str
        |> String.replace("-", "/")
        |> String.replace("$", "=")
        |> decode_base64
      end

    end
  end
end
