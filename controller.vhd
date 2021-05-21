----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2021 08:40:49 PM
-- Design Name: 
-- Module Name: controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( clk    : in STD_LOGIC;
           sample : in STD_LOGIC;
           reset   : out STD_LOGIC;
           enable  : out STD_LOGIC);
end controller;

architecture Behavioral of controller is
    
    constant numClockCycles : std_logic_vector(3 downto 0) := "1111";
    constant numZeros       : std_logic_vector(3 downto 0) := "1111";
    
    signal clockCyclesCnt  : std_logic_vector(3 downto 0);
    signal zerosCnt        : std_logic_vector(3 downto 0);
    signal clockCyclesDone : std_logic;
    signal zerosDone       : std_logic;
    
begin
    
    enable <= (zerosDone AND clockCyclesDone);
    reset  <= NOT(zerosDone AND clockCyclesDone);
    
    cycleCnt: process(sample,clk)
    begin
        if rising_edge(clk) then
            if rising_edge(sample) then
                clockCyclesCnt <= (others=>'0');
                clockCyclesDone <= '0';
            else
                if clockCyclesCnt < numClockCycles then
                    clockCyclesCnt <= clockCyclesCnt +1;
                    clockCyclesDone <= '0';
                else
                    clockCyclesDone <= '1';
                end if;
            end if;
        end if;
    end process;
    
    zeroCnt: process(sample,clk)
    begin
        if rising_edge(clk) then
            if rising_edge(sample) then
                zerosCnt <= (others=>'0');
                zerosDone <= '0';
            else
                if zerosCnt < numZeros then
                    if sample = '0' then
                        zerosCnt <= clockCyclesCnt +1;
                    end if;
                    zerosDone <= '0';
                else
                    zerosDone <= '1';
                end if;
            end if;
        end if;
    end process;

end Behavioral;