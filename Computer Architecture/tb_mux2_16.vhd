library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux2_16_tb is
end;

architecture bench of mux2_16_tb is

  component mux2_16
  	port(
  		S : in std_logic;
  		in0 : in std_logic_vector(15 downto 0);
  		in1 : in std_logic_vector(15 downto 0);
  		Z : out std_logic_vector(15 downto 0));
  end component;

  signal S: std_logic;
  signal in0: std_logic_vector(15 downto 0);
  signal in1: std_logic_vector(15 downto 0);
  signal Z: std_logic_vector(15 downto 0);

begin

  uut: mux2_16 port map ( S   => S,
                          in0 => in0,
                          in1 => in1,
                          Z   => Z );

  stimulus: process
  begin
  
    S <= '0';
    in0 <= x"aaaa";
    in1 <= x"bbbb";
    wait for 10 ns;

    S <= '1';
    wait for 10 ns;
    
    S <= '0';

    wait;
  end process;


end;