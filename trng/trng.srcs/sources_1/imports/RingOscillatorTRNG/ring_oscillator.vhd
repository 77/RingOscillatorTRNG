library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ring_oscillator is
    Port ( 
        output  : out std_logic
    );
end ring_oscillator;

architecture Behavioral of ring_oscillator is
    
    attribute KEEP : string;
    attribute S    : string;


    signal wire1 : std_logic := '0';
    signal wire2 : std_logic := '1';
    signal wire3 : std_logic := '1';
    signal wire4 : std_logic := '1';
    signal wire5 : std_logic := '1';
    
    signal outputwire : std_logic := '1';
    
    
    signal enable : std_logic := '0';
    
    attribute dont_touch : string;
    attribute DONT_TOUCH of wire1   : signal is "true";
    attribute DONT_TOUCH of wire2   : signal is "true";
    attribute DONT_TOUCH of wire3   : signal is "true";
    attribute DONT_TOUCH of wire4   : signal is "true";
    attribute DONT_TOUCH of wire5   : signal is "true";
    attribute DONT_TOUCH of outputwire : signal is "true";
    attribute DONT_TOUCH of enable  : signal is "true";

begin
    enable <= '1';
    wire2 <= not wire1;
    
    latch1 : process(enable, wire2)
    begin
        if enable = '1' then
            wire3 <= wire2;
        end if;
    end process;
    
    wire4 <= not wire3;
    wire5 <= not wire4;
    
    latch2 : process(enable, wire5)
    begin
        if enable = '1' then
            wire1 <= wire5;
        end if;
    end process;
    
    outputwire <= not wire5;
    output <= not outputwire;
end Behavioral;
