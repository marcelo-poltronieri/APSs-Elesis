library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuito is
	port (
    A,B,C : in  STD_LOGIC;
    x     : out STD_LOGIC);
end entity;

architecture arch of circuito is
    signal outAnd: STD_LOGIC;
    signal outNor: STD_LOGIC;
begin

    outAnd <= B and C;
    outNor <= not(not(A) or outAnd);

    x <= outNor and B and A;

end architecture;