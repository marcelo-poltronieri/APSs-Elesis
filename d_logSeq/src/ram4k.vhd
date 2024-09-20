Library ieee;
use ieee.std_logic_1164.all;

entity Ram4K is
    port(
        clock:   in  STD_LOGIC;
        input:   in  STD_LOGIC_VECTOR(15 downto 0);
        load:    in  STD_LOGIC;
        address: in  STD_LOGIC_VECTOR(11 downto 0);
        output:  out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of Ram4K is
    component Ram512 is
        port(
            clock:   in  STD_LOGIC;
            input:   in  STD_LOGIC_VECTOR(15 downto 0);
            load:    in  STD_LOGIC;
            address: in  STD_LOGIC_VECTOR(8 downto 0);
            output:  out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Mux8Way16 is
        port (
            a:   in  STD_LOGIC_VECTOR(15 downto 0);
            b:   in  STD_LOGIC_VECTOR(15 downto 0);
            c:   in  STD_LOGIC_VECTOR(15 downto 0);
            d:   in  STD_LOGIC_VECTOR(15 downto 0);
            e:   in  STD_LOGIC_VECTOR(15 downto 0);
            f:   in  STD_LOGIC_VECTOR(15 downto 0);
            g:   in  STD_LOGIC_VECTOR(15 downto 0);
            h:   in  STD_LOGIC_VECTOR(15 downto 0);
            sel: in  STD_LOGIC_VECTOR(2 downto 0);
            q:   out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component DMux8Way is
        port (
            a:   in  STD_LOGIC;
            sel: in  STD_LOGIC_VECTOR(2 downto 0);
            q0:  out STD_LOGIC;
            q1:  out STD_LOGIC;
            q2:  out STD_LOGIC;
            q3:  out STD_LOGIC;
            q4:  out STD_LOGIC;
            q5:  out STD_LOGIC;
            q6:  out STD_LOGIC;
            q7:  out STD_LOGIC
        );
    end component;

    signal load_signals : STD_LOGIC_VECTOR(7 downto 0);
    signal output0, output1, output2, output3, output4, output5, output6, output7 : STD_LOGIC_VECTOR(15 downto 0);

begin
    DMux_Instance: DMux8Way port map(
        a => load,
        sel => address(11 downto 9),
        q0 => load_signals(0),
        q1 => load_signals(1),
        q2 => load_signals(2),
		q3 => load_signals(3),
        q4 => load_signals(4),
        q5 => load_signals(5),
        q6 => load_signals(6),
        q7 => load_signals(7)
    );

    Ram512_0: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(0),
        address => address(8 downto 0),
        output => output0
    );
    Ram512_1: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(1),
        address => address(8 downto 0),
        output => output1
    );
    Ram512_2: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(2),
        address => address(8 downto 0),
        output => output2
    );
    Ram512_3: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(3),
        address => address(8 downto 0),
        output => output3
    );
    Ram512_4: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(4),
        address => address(8 downto 0),
        output => output4
    );
    Ram512_5: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(5),
        address => address(8 downto 0),
        output => output5
    );
    Ram512_6: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(6),
        address => address(8 downto 0),
        output => output6
    );
    Ram512_7: Ram512 port map(
        clock => clock,
        input => input,
        load => load_signals(7),
        address => address(8 downto 0),
        output => output7
    );

    Mux_Instance: Mux8Way16 port map(
        a => output0,
        b => output1,
        c => output2,
        d => output3,
        e => output4,
        f => output5,
        g => output6,
        h => output7,
        sel => address(11 downto 9),
        q => output
    );
end architecture;

