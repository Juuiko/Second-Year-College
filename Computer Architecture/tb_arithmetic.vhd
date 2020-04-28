library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity arithmetic_tb is
end;

architecture bench of arithmetic_tb is

  component arithmetic
  	port(
  			c_in : in std_logic;
          	A : in std_logic_vector (15 downto 0);
          	B : in std_logic_vector (15 downto 0);
          	s0 : in std_logic;
          	s1 : in std_logic;
          	G : out std_logic_vector (15 downto 0);
          	c_out : out std_logic;
          	V : out std_logic);
  end component;

  signal c_in: std_logic;
  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal s0: std_logic;
  signal s1: std_logic;
  signal G: std_logic_vector (15 downto 0);
  signal c_out: std_logic;
  signal V: std_logic;

    constant clk_period: Time := 80 ns;

begin

  uut: arithmetic port map ( c_in  => c_in,
                             A     => A,
                             B     => B,
                             s0    => s0,
                             s1    => s1,
                             G     => G,
                             c_out => c_out,
                             V     => V );

  stimulus: process
  begin
  
    s0 <= '0';
    s1 <= '0';
    B <= "1010101010101010"; 
    A <= "1010101010101010";
    c_in <= '1';
    wait for clk_period;



    s0 <= '0';
    s1 <= '1';
    A <= "1111111111111111";
    B <= "1111111111111111";
    c_in <= '0';
    wait for clk_period;

    s0 <= '0';
    s1 <= '1';
    A <= "0000000000000000";
    B <= "0000000000000000";
    c_in <= '1';
    wait for clk_period;

    s0 <= '1';
    s1 <= '0';
    A <= "1111111111111111";
    B <= "1111111111111111";
    c_in <= '0';
    wait for clk_period;

    s0 <= '1';
    s1 <= '1';
    B <= "1010101010101010";
    A <= "1010101010101010";
    c_in <= '1';
    wait for clk_period;
    
    s0 <= '1';
    s1 <= '0';
    A <= "1010101010101010";
    A <= "0101010101010101";
    c_in <= '1';

   wait;
  end process;

end;