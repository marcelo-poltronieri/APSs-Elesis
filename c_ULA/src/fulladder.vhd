-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port(
        a, b, c : in  STD_LOGIC;   -- entradas
        soma, vaium : out STD_LOGIC  -- soma e carry out
    );
end entity;

architecture rtl of FullAdder is
begin
    -- Implementação da lógica do Full Adder
    soma <= a XOR b XOR c;
    vaium <= (a AND b) OR (b AND c) OR (a AND c);
end architecture;
