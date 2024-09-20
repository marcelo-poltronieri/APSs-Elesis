library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor8way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of nor8way is
	signal word: STD_LOGIC_VECTOR(7 downto 0);
begin
	-- Agrupando os bits de entrada no vetor
    word <= (a, b, c, d, e, f, g, h);

    -- Realizando a operação NOR
    -- A operação OR é aplicada a todos os bits do vetor e o resultado é negado
    q <= not (word(0) or word(1) or word(2) or word(3) or word(4) or word(5) or word(6) or word(7));
end architecture;
