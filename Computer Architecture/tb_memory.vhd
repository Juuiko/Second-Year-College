library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity memory_tb is
end;

architecture bench of memory_tb is

  component memory
  	port(
  		data_in : in std_logic_vector (15 downto 0);
  		address : in std_logic_vector (15 downto 0);
  		MW : in std_logic;
  		data_out : out std_logic_vector (15 downto 0));
  end component;

  signal data_in: std_logic_vector (15 downto 0);
  signal address: std_logic_vector (15 downto 0);
  signal MW: std_logic;
  signal data_out: std_logic_vector (15 downto 0);

    constant clock: Time := 20 ns;

begin

  uut: memory port map ( data_in  => data_in,
                         address  => address,
                         MW       => MW,
                         data_out => data_out );

  stimulus: process
  begin
  
    MW <= '1';
    data_in <= X"0000";
    address <= X"0000";
    
    wait for clock;    
    data_in <= X"0001";
    address <= X"0001";
    
    wait for clock;    
    data_in <= X"0002";
    address <= X"0002";
    
    wait for clock;    
    data_in <= X"0003";
    address <= X"0003";
    
    wait for clock;    
    MW <= '0';
    data_in <= X"0000";
    address <= X"0000";
    
    wait for clock;    
    address <= X"0001";
    
    wait for clock;    
    address <= X"0002";
    
    wait for clock;    
    address <= X"0003";
    
    wait for clock;    
    address <= X"0004";

    wait;
  end process;


end;