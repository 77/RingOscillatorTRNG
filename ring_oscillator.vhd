----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2021 11:43:28 AM
-- Design Name: 
-- Module Name: ring_oscillator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ring_oscillator is
    Port ( 
        clk     : in std_logic;
        output  : out std_logic
    );
end ring_oscillator;

architecture Behavioral of ring_oscillator is

    signal wire1 : std_logic := '0';
    signal wire2 : std_logic := '1';
    signal wire3 : std_logic := '1';
    signal wire4 : std_logic := '1';
    
    signal enable : std_logic := '0';

begin
    enable <= '1';

    wire2 <= not wire1;
    flop1 : process(clk)
    begin
        if rising_edge(clk) then
            wire3 <= wire2;
        end if;
    end process;
    
    latch1 : process(enable)
    begin 
        if enable = '1' then
            wire4 <= wire3;
        end if;
    end process;
 
    latch2 : process(enable)
    begin 
        if enable = '1' then
            output <= wire4;
        end if;
    end process;
    
    flop2 : process(clk)
    begin
        if rising_edge(clk) then
            wire1 <= wire4;
        end if;
    end process;
    
end Behavioral;
