library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux2_1_tb is
end;

architecture bench of mux2_1_tb is

  component mux2_1
  	port(
  		S : in std_logic;
  		in0 : in std_logic;
  		in1 : in std_logic;
  		Z : out std_logic);
  end component;

  signal S: std_logic;
  signal in0: std_logic;
  signal in1: std_logic;
  signal Z: std_logic;

begin

  uut: mux2_1 port map ( S   => S,
                         in0 => in0,
                         in1 => in1,
                         Z   => Z );

  stimulus: process
  begin
  
    In0 <= '1';
    In1 <= '0';
    s <= '0';
    wait for 10 ns;
    
    s <= '1';
    wait;
  end process;

end;