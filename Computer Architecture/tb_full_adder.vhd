library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity full_adder_tb is
end;

architecture bench of full_adder_tb is

  component full_adder
      port ( 
  		    A : in std_logic;
          B : in std_logic;
          c_in : in std_logic;
          S : out std_logic;
          c_out : out std_logic);
  end component;

  signal A: std_logic;
  signal B: std_logic;
  signal c_in: std_logic;
  signal S: std_logic;
  signal c_out: std_logic;

begin

  uut: full_adder port map ( A     => A,
                             B     => B,
                             c_in  => c_in,
                             S     => S,
                             c_out => c_out );

  stimulus: process
  begin
  
    A <= '0';
    B <= '0';
    c_in <= '0';
    wait for 10 ns;
    A <= '1';
    wait for 10 ns;
    A <= '0';
    B <= '1';
    wait for 10 ns;
    A <= '1';
    wait for 10 ns;
    A <= '0';
    B <= '0';
    c_in <= '1';
    wait for 10 ns;
    B <= '1';
    wait for 10 ns;
    A <= '1';
    B <= '0';
    wait for 10 ns;
    B <= '1';

    wait;
  end process;


end;