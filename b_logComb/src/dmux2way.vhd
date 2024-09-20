library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux2way is
    port (
        a:   in  STD_LOGIC;  -- Entrada
        sel: in  STD_LOGIC;  -- Sinal de Seleção
        q0:  out STD_LOGIC;  -- Saída 0
        q1:  out STD_LOGIC   -- Saída 1
    );
end entity;

architecture rtl of dmux2way is
begin
    -- Implementação do demultiplexador
    q0 <= a when sel = '0' else '0'; -- Direciona a entrada para q0 se sel for 0, senão q0 é 0
    q1 <= a when sel = '1' else '0'; -- Direciona a entrada para q1 se sel for 1, senão q1 é 0
end architecture;
