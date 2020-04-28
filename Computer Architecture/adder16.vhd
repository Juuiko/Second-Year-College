library ieee;
use ieee.std_logic_1164.all;


entity adder16 is
    port ( 
		A : in std_logic_vector (15 downto 0);
		B : in std_logic_vector (15 downto 0);
		c_in : in std_logic;
		c_out : out std_logic;
		S : out std_logic_vector (15 downto 0);
		V : out std_logic);
end adder16;

architecture behavioral of adder16 is

component full_adder port (
          A : in std_logic;
          B : in std_logic;
          c_in : in std_logic;
          S : out std_logic;
          c_out : out std_logic);
end component;

signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic;

begin
	adder0: full_adder port map(A => A(0),B => B(0),c_in => c_in,S => S(0),c_out => c0);
	adder1: full_adder port map(A => A(1),B => B(1),c_in => c0,S => S(1),c_out => c1);
	adder2: full_adder port map(A => A(2),B => B(2),c_in => c1,S => S(2),c_out => c2);
	adder3: full_adder port map(A => A(3),B => B(3),c_in => c2,S => S(3),c_out => c3);
	adder4: full_adder port map(A => A(4),B => B(4),c_in => c3,S => S(4),c_out => c4);
	adder5: full_adder port map(A => A(5),B => B(5),c_in => c4,S => S(5),c_out => c5);
	adder6: full_adder port map(A => A(6),B => B(6),c_in => c5,S => S(6),c_out => c6);
	adder7: full_adder port map(A => A(7),B => B(7),c_in => c6,S => S(7),c_out => c7);
	adder8: full_adder port map(A => A(8),B => B(8),c_in => c7,S => S(8),c_out => c8);
	adder9: full_adder port map(A => A(9),B => B(9),c_in => c8,S => S(9),c_out => c9);
	adder10: full_adder port map(A => A(10),B => B(10),c_in => c9,S => S(10),c_out => c10);
	adder11: full_adder port map(A => A(11),B => B(11),c_in => c10,S => S(11),c_out => c11);
	adder12: full_adder port map(A => A(12),B => B(12),c_in => c11,S => S(12),c_out => c12);
	adder13: full_adder port map(A => A(13),B => B(13),c_in => c12,S => S(13),c_out => c13);
	adder14: full_adder port map(A => A(14),B => B(14),c_in => c13,S => S(14),c_out => c14);
	adder15: full_adder port map(A => A(15),B => B(15),c_in => c14,S => S(15),c_out => c15);
	
	c_out <= c15;
	V <= c14 xor c15;

end behavioral;