library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or8way is
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

architecture arch of or8way is
	signal word: STD_LOGIC_VECTOR(7 downto 0);
begin

word(7) <= a;
word(6) <= b;
word(5) <= c;
word(4) <= d;
word(3) <= e;
word(2) <= f;
word(1) <= g;
word(0) <= h;


q <= word(7) or word(6) or word(5) or word(4) or word(3) or word(2) or word(1) or word(0);

end architecture;
