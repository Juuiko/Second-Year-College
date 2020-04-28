library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sign_extended_tb is
end;

architecture bench of sign_extended_tb is

  component sign_extended
  	port(
  		I : in std_logic_vector(5 downto 0);
  		O : out std_logic_vector(15 downto 0));
  end component;

  signal I: std_logic_vector(5 downto 0);
  signal O: std_logic_vector(15 downto 0);

    constant clock: Time := 20 ns;

begin

  uut: sign_extended port map ( I => I,
                                O => O );

  stimulus: process
  begin
  
    wait for clock;
    I <= "000000";
    
    wait for clock;
    I <= "000001";
    
    wait for clock;
    I <= "011111";
    
    wait for clock;
    I <= "100000";
    
    wait for clock;
    I <= "111111";
    
    wait for clock;
    I <= "010101";

  wait;
  
  end process;


end;