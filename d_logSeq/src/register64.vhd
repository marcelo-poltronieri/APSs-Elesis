Library ieee;
use ieee.std_logic_1164.all;

entity Register64 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(63 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(63 downto 0)
	);
end entity;

architecture arch of Register64 is
	component Register32 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(31 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;

	signal lower_half: STD_LOGIC_VECTOR(31 downto 0);
	signal upper_half: STD_LOGIC_VECTOR(31 downto 0);

begin
	-- Instância para os 32 bits menos significativos
	Register_Lower: Register32 port map(
		clock  => clock,
		input  => input(31 downto 0),  -- Os 32 bits menos significativos do input
		load   => load,
		output => lower_half
	);

	-- Instância para os 32 bits mais significativos
	Register_Upper: Register32 port map(
		clock  => clock,
		input  => input(63 downto 32), -- Os 32 bits mais significativos do input
		load   => load,
		output => upper_half
	);

	-- Concatenando as saídas dos dois Register32 para formar a saída de 64 bits
	output <= upper_half & lower_half;

end architecture;
