library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity detectordemoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectordemoedas is

begin
    -- Processo para determinar o valor da moeda
    process(Q, D, N)
    begin
        if Q = '1' then
            -- Se um quarter é detectado, atribui-se 25 centavos
            cents <= std_logic_vector(to_unsigned(25, 5));
        elsif D = '1' then
            -- Se um dime é detectado, atribui-se 10 centavos
            cents <= std_logic_vector(to_unsigned(10, 5));
        elsif N = '1' then
            -- Se um nickel é detectado, atribui-se 5 centavos
            cents <= std_logic_vector(to_unsigned(5, 5));
        else
            -- Se nenhuma moeda é detectada, atribui-se 0 centavos
            cents <= (others => '0');
        end if;
    end process;
end architecture;
