library ieee;
use ieee.std_logic_1164.all;

entity shifter is
    port (
		S : in std_logic_vector(1 downto 0);
		IR : in STD_LOGIC;
		IL : in STD_LOGIC;
        B : in std_logic_vector(15 downto 0);
        H : out std_logic_vector(15 downto 0)
     );
end shifter;

architecture behavioral of shifter is

	component mux3_1 port(
        in0 : in std_logic;
        in1 : in std_logic;
        in2 : in std_logic;
        S : in std_logic_vector(1 downto 0); 
        Q : out std_logic);
	end component;
begin
	mux0 : mux3_1 port map(
		S => S,
		in0 => B(0),
		in1 => B(1),
		in2 => IL,
		Q => H(0));

	mux1 : mux3_1 port map(
		S => S,
		in0 => B(1),
		in1 => B(2),
		in2 => B(0),
		Q => H(1));

	mux2 : mux3_1 port map(
		S => S,
		in0 => B(2),
		in1 => B(3),
		in2 => B(1),
		Q => H(2));

	mux3 : mux3_1 port map(
		S => S,
		in0 => B(3),
		in1 => B(4),
		in2 => B(2),
		Q => H(3));

	mux4 : mux3_1 port map(
		S => S,
		in0 => B(4),
		in1 => B(5),
		in2 => B(3),
		Q => H(4));

	mux5 : mux3_1 port map(
		S => S,
		in0 => B(5),
		in1 => B(6),
		in2 => B(4),
		Q => H(5));

	mux6 : mux3_1 port map(
		S => S,
		in0 => B(6),
		in1 => B(7),
		in2 => B(5),
		Q => H(6));

	mux7 : mux3_1 port map(
		S => S,
		in0 => B(7),
		in1 => B(8),
		in2 => B(6),
		Q => H(7));

	mux8 : mux3_1 port map(
		S => S,
		in0 => B(8),
		in1 => B(9),
		in2 => B(7),
		Q => H(8));

	mux9 : mux3_1 port map(
		S => S,
		in0 => B(9),
		in1 => B(10),
		in2 => B(8),
		Q => H(9));

	mux10 : mux3_1 port map(
		S => S,
		in0 => B(10),
		in1 => B(11),
		in2 => B(9),
		Q => H(10));

	mux11 : mux3_1 port map(
		S => S,
		in0 => B(11),
		in1 => B(12),
		in2 => B(10),
		Q => H(11));

	mux12 : mux3_1 port map(
		S => S,
		in0 => B(12),
		in1 => B(13),
		in2 => B(11),
		Q => H(12));

	mux13 : mux3_1 port map(
		S => S,
		in0 => B(13),
		in1 => B(14),
		in2 => B(12),
		Q => H(13));

	mux14 : mux3_1 port map(
		S => S,
		in0 => B(14),
		in1 => B(15),
		in2 => B(13),
		Q => H(14));

	mux15 : mux3_1 port map(
		S => S,
		in0 => B(15),
		in1 => IR,
		in2 => B(14),
		Q => H(15));

end behavioral;
