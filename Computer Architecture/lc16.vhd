library ieee;
use ieee.std_logic_1164.all;

entity lc16 is
    port ( 
		A : in std_logic_vector (15 downto 0);
        B : in std_logic_vector (15 downto 0);
        s0 : in std_logic;
        s1 : in std_logic;
        G : out std_logic_vector (15 downto 0));
end lc16;

architecture behavioral of lc16 is

	component lc_slice port( 
		s0 : in std_logic;
		s1 : in std_logic;
		A : in std_logic;
		B : in std_logic;
		G : out std_logic);
	end component;

begin

slice0: lc_slice port map(s0 => s0, s1 => s1, A => A(0), B => B(0), G => G(0));
slice1: lc_slice port map(s0 => s0, s1 => s1, A => A(1), B => B(1), G => G(1));
slice2: lc_slice port map(s0 => s0, s1 => s1, A => A(2), B => B(2), G => G(2));
slice3: lc_slice port map(s0 => s0, s1 => s1, A => A(3), B => B(3), G => G(3));
slice4: lc_slice port map(s0 => s0, s1 => s1, A => A(4), B => B(4), G => G(4));
slice5: lc_slice port map(s0 => s0, s1 => s1, A => A(5), B => B(5), G => G(5));
slice6: lc_slice port map(s0 => s0, s1 => s1, A => A(6), B => B(6), G => G(6));
slice7: lc_slice port map(s0 => s0, s1 => s1, A => A(7), B => B(7), G => G(7));
slice8: lc_slice port map(s0 => s0, s1 => s1, A => A(8), B => B(8), G => G(8));
slice9: lc_slice port map(s0 => s0, s1 => s1, A => A(9), B => B(9), G => G(9));
slice10: lc_slice port map(s0 => s0, s1 => s1, A => A(10), B => B(10), G => G(10));
slice11: lc_slice port map(s0 => s0, s1 => s1, A => A(11), B => B(11), G => G(11));
slice12: lc_slice port map(s0 => s0, s1 => s1, A => A(12), B => B(12), G => G(12));
slice13: lc_slice port map(s0 => s0, s1 => s1, A => A(13), B => B(13), G => G(13));
slice14: lc_slice port map(s0 => s0, s1 => s1, A => A(14), B => B(14), G => G(14));
slice15: lc_slice port map(s0 => s0, s1 => s1, A => A(15), B => B(15), G => G(15));

end behavioral;