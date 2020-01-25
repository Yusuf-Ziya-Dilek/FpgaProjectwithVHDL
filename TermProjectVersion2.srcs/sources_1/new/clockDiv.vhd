-- Engineer : Yusuf Ziya Dilek
-- This module outputs clock signal

-- Necessary imports
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Start of the Clock Division module
entity clockDiv is
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clockOut : out STD_LOGIC_VECTOR (15 downto 0));
end clockDiv;

architecture Behavioral of clockDiv is

begin
    -- Process begings here
    PROCESS (clock, reset)
        -- Counter will be assigned to clockOut in the end
        variable counter : std_logic_vector (15 downto 0) := (others => '0'); 
        begin
            -- If- else statements for incrementing counter
            if reset = '1' then
                counter := (others => '0');
            elsif enable = '1' and clock = '1' and clock'event then -- Incrementing counter            
                counter := counter + 1;
            end if;
            -- Assigning 16 bit output signal only 16th bit will be used
            -- Thanks to that speed of clock is going to be divided from 50MHz to 1.525KHz
            -- Which is very optimal refresh rate for seven segment display
            clockOut <=  counter;
    end process;               

end Behavioral;
