library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenseg is
    port (
        bcd : in  STD_LOGIC_VECTOR(3 downto 0);
        leds: out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity;

architecture arch of sevenseg is
begin
    
    leds <= "1000000" when bcd = "0000" else  -- 0
            "1111001" when bcd = "0001" else  -- 1
            "0100100" when bcd = "0010" else  -- 2
            "0110000" when bcd = "0011" else  -- 3
            "0011001" when bcd = "0100" else  -- 4
            "0010010" when bcd = "0101" else  -- 5
            "0000010" when bcd = "0110" else  -- 6
            "1111000" when bcd = "0111" else  -- 7
            "0000000" when bcd = "1000" else  -- 8
            "0010000" when bcd = "1001" else  -- 9
            "1111111";  
end architecture;

