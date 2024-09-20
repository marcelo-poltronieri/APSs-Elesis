library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity carrinho is
	port (
			CLOCK_50 : in  std_logic;
            -- iniciando as portas lógicas
            -- s1,s2,s3,s4 as saídas de nossas funções lógicas
            -- sejam e1,e2,e3 e e4 as entradas de nossas portas lógicas 
			
			s1: out STD_LOGIC;
			s2: out STD_LOGIC;
			s3: out STD_LOGIC;
			s4: out STD_LOGIC;
            e1: in  STD_LOGIC;
			e2: in  STD_LOGIC;
			e3: in  STD_LOGIC;
			e4: in  STD_LOGIC
 );
end entity;

architecture rtl of carrinho is
begin
    -- encontrando a equação de cada porta lógica
	s1 <= not(e2 )and not (e4);
    -- a entrada s1 é um and , pode-se pensar na operação de multiplicação de um not com outro not
	s2 <= (not(e1) and not(e2) and e3 and e4) or (e1 and e2 and not(e3) and not(e4));
    -- junção de alguns ands e no fim utilizou-se  a porta lógica ou
	s3 <= not(e1) and not (e3);
    -- analogamente a expressão 1, segue acima a expressão 
	s4 <= (not(e1) and not(e2) and e3 and e4) or (e1 and e2 and not(e3) and not(e4));

end rtl;nossas