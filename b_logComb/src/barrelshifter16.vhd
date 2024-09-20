library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity barrelshifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			selecionador: in std_logic;
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of barrelshifter16 is
	--signal num: integer;
	signal a_unsigned : unsigned(15 downto 0);
    signal q_unsigned : unsigned(15 downto 0);
begin
	a_unsigned <= unsigned(a);
	q_unsigned <= shift_left(a_unsigned, to_integer(unsigned(size))) when (dir='0' and selecionador='1') else shift_right(a_unsigned, to_integer(unsigned(size))) when (dir='1' and selecionador='1') else a_unsigned;
	q <= std_logic_vector(q_unsigned);
end architecture;
