library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity adder16_tb is
end;

architecture bench of adder16_tb is

  component adder16
      port ( 
  		A : in std_logic_vector (15 downto 0);
  		B : in std_logic_vector (15 downto 0);
  		c_in : in std_logic;
  		c_out : out std_logic;
  		S : out std_logic_vector (15 downto 0);
  		V : out std_logic);
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal c_in: std_logic;
  signal c_out: std_logic;
  signal S: std_logic_vector (15 downto 0);
  signal V: std_logic;

begin

  uut: adder16 port map ( A     => A,
                          B     => B,
                          c_in  => c_in,
                          c_out => c_out,
                          S     => S,
                          V     => V );

  stimulus: process
  begin
    c_in <= '0';
  
    A <= "0000000000000011";
    B <= "0000000000000100";
    wait for 100 ns;
    
    A <= "1000000000000000";
    B <= "1000000000000000";
    wait for 100 ns;
    
    c_in <= '1';
    A <= "1010101010101010";
    B <= "0000000000000000";
    wait for 100 ns;
    
    A <= "1111111111111110";
    B <= "0000000000000000";
    c_in <= '1';

    wait;
  end process;


end;