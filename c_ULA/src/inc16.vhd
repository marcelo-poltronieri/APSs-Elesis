-- Elementos de Sistemas
-- by Luciano Soares
-- Inc16.vhd

-- Incrementador de 16 bits
-- adiciona 1 ao valore de entrada (adição aritmética)

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inc16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Inc16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component Add16 is
    port(
      a   :  in STD_LOGIC_VECTOR(15 downto 0);
      b   :  in STD_LOGIC_VECTOR(15 downto 0);
      q   : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;
  -- Aqui, estamos criando uma variável const com o valor a seguir.
  constant one : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";

begin
  -- Implementação vem aqui!
  -- Chame o componente Add16, conectando a ao a do Inc16
  Add16_inst: Add16
  port map (
            a   => a,     -- Conecta a do Add16 com a do Inc16
            b   => one,   -- Valor '1' a ser somado
            q   => q      -- Resultado da adição
            );
end architecture;