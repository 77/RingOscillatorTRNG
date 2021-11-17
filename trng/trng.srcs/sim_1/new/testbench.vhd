library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture behavioral of testbench is

  component design_1_wrapper is
  port (
    BTNC_0 : in STD_LOGIC;
    CLK_0 : in STD_LOGIC;
    DISP_EN_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    LED_0 : out STD_LOGIC;
    SEGMENTS_0 : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  end component design_1_wrapper;

  signal BTNC_0 : std_logic;
  signal CLK_0 : std_logic := '1';
  signal DISP_EN_0 : std_logic_vector ( 3 downto 0 );
  signal LED_0 : std_logic;
  signal SEGMENTS_0 : std_logic_vector ( 6 downto 0 );

begin

  clk_gen : process begin
    CLK_0 <= not CLK_0;
    wait for 5 ns;
    CLK_0 <= not CLK_0;
    wait for 5 ns;
  end process;

  stim_gen : process begin
    BTNC_0 <= '1';
    wait for 33 ns;
    BTNC_0 <= '0';
    wait for 3333 ns;
  end process;  
  
  uut : component design_1_wrapper
    port map(
      BTNC_0 => BTNC_0,
      CLK_0 => CLK_0,
      DISP_EN_0 => DISP_EN_0,
      LED_0 => LED_0,
      SEGMENTS_0 => SEGMENTS_0
    );

  end behavioral;