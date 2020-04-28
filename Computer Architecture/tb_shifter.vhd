library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shifter_tb is
end;

architecture bench of shifter_tb is

  component shifter
      port (
  		S : in std_logic_vector(1 downto 0);
      B : in std_logic_vector(15 downto 0);
      H : out std_logic_vector(15 downto 0)
       );
  end component;

  signal S: std_logic_vector(1 downto 0);
  signal B: std_logic_vector(15 downto 0);
  signal H: std_logic_vector(15 downto 0) ;

  constant clk_period: Time := 5 ns;

begin

  uut: shifter port map ( S  => S,
                          B  => B,
                          H  => H );

  stimulus: process
  begin
  
    S <= "01";
    B <= x"0002";

    wait for 100 ns;
    S <= "10";
    wait for 100 ns;

    wait;
  end process;

end;