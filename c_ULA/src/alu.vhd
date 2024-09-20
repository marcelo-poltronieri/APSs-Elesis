
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
	port (
			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
			zx:    in STD_LOGIC;                     -- zera a entrada x
			nx:    in STD_LOGIC;                     -- inverte a entrada x
			zy:    in STD_LOGIC;                     -- zera a entrada y
			ny:    in STD_LOGIC;                     -- inverte a entrada y
			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
			no:    in STD_LOGIC;                     -- inverte o valor da saída
			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
			ng:    out STD_LOGIC;					-- setado se saída é negativa
			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
			

	);
end entity;

architecture  rtl OF alu is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

	component zerador16 IS
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
			);
	end component;

	component inversor16 is
		port(z   : in STD_LOGIC;
			 a   : in STD_LOGIC_VECTOR(15 downto 0);
			 y   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0);
			over : out std_logic
		);
	end component;

	component and16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component comparador16 is
		port(
			a   : in STD_LOGIC_VECTOR(15 downto 0);
			zr   : out STD_LOGIC;
			ng   : out STD_LOGIC
    );
	end component;

	component mux16 is
		port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;	


   SIGNAL zxout,zyout,nxout,nyout,outXor,andout,adderout,muxout,precomp: std_logic_vector(15 downto 0);
   SIGNAL carry: std_logic;	
begin
  -- Implementação vem aqui!

  	-- Zerar entrada x
	  zerador_x: zerador16 port map(z => zx, a => x, y => zxout);
	-- Invertar entrada x
	inversor_x: inversor16 port map(z => nx, a => zxout, y => nxout);
	-- Zerar entrada y
	zerador_y: zerador16 port map(z => zy, a => y, y => zyout);
	-- Invertar entrada y
	inversor_y: inversor16 port map(z => ny, a => zyout, y => nyout);
	-- Adição
	adder: Add16 port map(a => nxout, b => nyout, q => adderout);
	-- And
	and_porta: And16 port map(a => nxout, b => nyout, q => andout);
	-- Mux
	mux_and_adder: Mux16 port map(a => andout, b => adderout, sel => f, q => muxout);
	-- Inverter saida
	inversor_saida: inversor16 port map(z => no, a => muxout, y => precomp);
	-- Verificar saída
	comparador_saida: comparador16 port map(a => precomp, zr => zr, ng => ng);
	-- Saída
	saida <= precomp;

end architecture;
