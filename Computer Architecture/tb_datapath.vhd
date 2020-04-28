library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity datapath_tb is
end;

architecture bench of datapath_tb is

  component datapath
  	port(
  		constant_in : in STD_LOGIC_VECTOR (15 downto 0);
          MB_select : in STD_LOGIC;
          MD_select : in STD_LOGIC;
          data_in : in STD_LOGIC_VECTOR (15 downto 0);
          clk : in STD_LOGIC;
          write : in STD_LOGIC;
          D_address : in STD_LOGIC_VECTOR(2 downto 0);
          A_address : in STD_LOGIC_VECTOR(2 downto 0);
          B_address : in STD_LOGIC_VECTOR(2 downto 0);
          FS : in STD_LOGIC_VECTOR(4 downto 0);
          address_out : out STD_LOGIC_VECTOR (15 downto 0);
          data_out : out STD_LOGIC_VECTOR (15 downto 0);
          V : out STD_LOGIC;
          C : out STD_LOGIC;
          N : out STD_LOGIC;
          Z : out STD_LOGIC);
  end component;

  signal constant_in: STD_LOGIC_VECTOR (15 downto 0);
  signal MB_select: STD_LOGIC;
  signal MD_select: STD_LOGIC;
  signal data_in: STD_LOGIC_VECTOR (15 downto 0);
  signal clk: STD_LOGIC;
  signal write: STD_LOGIC;
  signal D_address: STD_LOGIC_VECTOR(2 downto 0);
  signal A_address: STD_LOGIC_VECTOR(2 downto 0);
  signal B_address: STD_LOGIC_VECTOR(2 downto 0);
  signal FS: STD_LOGIC_VECTOR(4 downto 0);
  signal address_out: STD_LOGIC_VECTOR (15 downto 0);
  signal data_out: STD_LOGIC_VECTOR (15 downto 0);
  signal V: STD_LOGIC;
  signal C: STD_LOGIC;
  signal N: STD_LOGIC;
  signal Z: STD_LOGIC;
  

    constant clk_period: Time := 40 ns;
begin

  uut: datapath port map ( constant_in => constant_in,
                           MB_select   => MB_select,
                           MD_select   => MD_select,
                           data_in     => data_in,
                           clk         => clk,
                           write       => write,
                           D_address   => D_address,
                           A_address   => A_address,
                           B_address   => B_address,
                           FS          => FS,
                           address_out => address_out,
                           data_out    => data_out,
                           V           => V,
                           C           => C,
                           N           => N,
                           Z           => Z );



  stimulus: process
  begin

    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- write value to register 0 and display it on data out
    write <= '1';
    MD_select <= '1';
    D_address <= "000";
    data_in <= "0000000000000000";
    MB_select <= '0';
    B_address <= "000";
    A_address <= "000";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- write a value to register 1 and display it on data out
    D_address <= "001";
    data_in <= "0000000000000001";
    MB_select <= '0';
    B_address <= "001";
    A_address <= "001";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- transfer the value in R0 into R2; R1=0x0000
    D_address <= "010";
    A_address <= "000";
    MD_select <= '0';
    FS <= "00000";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- view output of previous operation on data out
    write <= '0';
    MB_select <= '0';
    B_address <= "010";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- increment R1 into R3; R2=0x0002
    D_address <= "011";
    A_address <= "001";
    write <= '1';
    FS <= "00001";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    -- view output of previous operation on data out
    write <= '0';
    MB_select <= '0';
    B_address <= "011";
    
    -- rising edge
    wait for clk_period;
    clk <= '1';
    
    -- falling edge
    wait for clk_period;
    clk <= '0';
    --- write the value of constant in to data out
    MB_select <= '1';
    constant_in <= "1111111111111111";
    
        wait;
  end process;


end;