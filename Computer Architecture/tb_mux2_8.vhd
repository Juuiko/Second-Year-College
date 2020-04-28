library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux2_8_tb is
end;

architecture bench of mux2_8_tb is

  component mux2_8
  	port(
  		in0 : in std_logic_vector (7 downto 0);
          in1 : in std_logic_vector (7 downto 0);
          S : in std_logic;
          Z : out std_logic_vector (7 downto 0));
  end component;

  signal in0: std_logic_vector (7 downto 0);
  signal in1: std_logic_vector (7 downto 0);
  signal S: std_logic;
  signal Z: std_logic_vector (7 downto 0);

  constant clock: Time := 10 ns;

begin

  uut: mux2_8 port map ( in0 => in0,
                         in1 => in1,
                         S   => S,
                         Z   => Z );

  stimulus: process
  begin
  
    in0 <= "10101010";
    in1 <= "01010101";
    
    wait for clock;
    s <= '0';
    
    wait for clock;
    s <= '1';
    
    wait for clock;
    s <= '0';
    
    wait for clock;
    s <= '1';

    wait;
  end process;


end;