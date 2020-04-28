library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity zero_fill_tb is
end;

architecture bench of zero_fill_tb is

  component zero_fill
  	port(
  		I : in std_logic_vector(2 downto 0);
          O : out std_logic_vector(15 downto 0));
  end component;

  signal I: std_logic_vector(2 downto 0);
  signal O: std_logic_vector(15 downto 0);

    constant clock: Time := 20 ns;

begin

  uut: zero_fill port map ( I => I,
                            O => O );

  stimulus: process
  begin
  
    I <= "001";
    wait for clock;
    
    I <= "100";
    wait for clock;
    
    I <= "101";
    wait for clock;
    
    I <= "111";    

  wait;

  end process;


end;