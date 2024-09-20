library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor3 is
    port 
    (
        sel1: in STD_LOGIC_VECTOR(2 downto 0)
        o: out std_logic;
    );
end xor3;

architecture Xor3 of xor3 is

    component mux8way is
        port(
            a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC
        );
    end component;

    begin
        u1: mux8way port map(
            a => '0',
            b => '1',
            c => '1',
            d => '0',
            e => '1',
            f => '0',
            g => '0',
            h => '1',
            sel => sel1,
            q => o
        );

    end architecture;
