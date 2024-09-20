library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4way16 is
	port ( 
		a:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada A
		b:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada B
		c:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada C
		d:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada D
		sel: in  STD_LOGIC_VECTOR(1 downto 0);  -- Sinal de Seleção
		q:   out STD_LOGIC_VECTOR(15 downto 0)  -- Saída
	);
end entity;

architecture arch of mux4way16 is
begin
    -- Implementação do multiplexador de 4 vias
    with sel select
        q <= a when "00",
             b when "01",
             c when "10",
             d when "11",
             (others => '0') when others; -- Caso padrão (opcional, pode ser removido se garantido que sel está dentro de '00' a '11')
end architecture;
