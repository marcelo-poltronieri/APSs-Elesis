library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8way16 is
    port ( 
        a:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada A
        b:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada B
        c:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada C
        d:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada D
        e:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada E
        f:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada F
        g:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada G
        h:   in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada H
        sel: in  STD_LOGIC_VECTOR(2 downto 0);  -- Sinal de Seleção
        q:   out STD_LOGIC_VECTOR(15 downto 0)  -- Saída
    );
end entity;

architecture arch of mux8way16 is
begin
    -- Implementação do multiplexador de 8 vias
    with sel select
        q <= a when "000",
             b when "001",
             c when "010",
             d when "011",
             e when "100",
             f when "101",
             g when "110",
             h when "111",
             (others => '0') when others;
end architecture;
