library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2way is
	port ( 
		a:   in  STD_LOGIC;    -- Entrada A
		b:   in  STD_LOGIC;    -- Entrada B
		sel: in  STD_LOGIC;    -- Sinal de Seleção
		q:   out STD_LOGIC     -- Saída
	);
end entity;

architecture arch of mux2way is
begin
    -- Implementação do multiplexador
    q <= a when sel = '0' else b;
end architecture;
