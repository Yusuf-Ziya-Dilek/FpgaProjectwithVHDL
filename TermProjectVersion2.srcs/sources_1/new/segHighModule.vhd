-- Engineer : Yusuf Ziya Dilek
-- This module Combines Clockdiv and segDecoder modules

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Beginnig of High Module which Combines clock divider and segmentdecoder and acts like MUX
entity segHighModule is
    Port ( ssdDisp0 : in STD_LOGIC_VECTOR (3 downto 0);
           ssdDisp1 : in STD_LOGIC_VECTOR (3 downto 0);
           ssdDisp2 : in STD_LOGIC_VECTOR (3 downto 0);
           ssdDisp3 : in STD_LOGIC_VECTOR (3 downto 0);
           highSegA : out STD_LOGIC;
           highSegB : out STD_LOGIC;
           highSegC : out STD_LOGIC;
           highSegD : out STD_LOGIC;
           highSegE : out STD_LOGIC;
           highSegF : out STD_LOGIC;
           highSegG : out STD_LOGIC;
           selDispA : out STD_LOGIC;
           selDispB : out STD_LOGIC;
           selDispC : out STD_LOGIC;
           selDispD : out STD_LOGIC;
           clock : in STD_LOGIC);
end segHighModule;

architecture Behavioral of segHighModule is
    -- Segment Divider Component
    COMPONENT segDecoder
        port ( dig4Bit : in STD_LOGIC_VECTOR (3 downto 0);
               lowSegA : out STD_LOGIC;
               lowSegB : out STD_LOGIC;
               lowSegC : out STD_LOGIC;
               lowSegD : out STD_LOGIC;
               lowSegE : out STD_LOGIC;
               lowSegF : out STD_LOGIC;
               lowSegG : out STD_LOGIC
        );
    end COMPONENT;
-- Clock Division component
    COMPONENT clockDiv
        port ( clock : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC;
               clockOut : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end COMPONENT;
    -- End of the Component Decleration part
    
    -- Signals
    Signal tempData : std_logic_vector (3 downto 0); -- 4bit signal which will be decoded to ssd display
    Signal clockFast : std_logic_vector (15 downto 0); -- 15 bit fast clock
    Signal clockSlow : std_logic; -- 1 bit 1.525KHz clock           
begin
    -- Instantiation of related components
    -- First uut Segment decoder module
    uut: segDecoder 
        PORT MAP (
                   dig4Bit => tempData,
                   lowSegA => highSegA,
                   lowSegB => highSegB,
                   lowSegC => highSegC,
                   lowSegD => highSegD,
                   lowSegE => highSegE,
                   lowSegF => highSegF,
                   lowSegG => highSegG       
        );
    --Second uut Clock division module    
    uut1: clockDiv 
        PORT MAP (
                   clock => clock,
                   enable => '1',
                   reset => '0',
                   clockOut => clockFast      
        );
    -- End of instantiation of components
    
    -- Slowing down the Clock 
    clockSlow <= clockFast(15);
    
    -- Process for MUX, clock is selection input  
    PROCESS (clockSlow)
        variable selDisp : std_logic_vector (1 downto 0);
        Begin
            if clockSlow'event and clockSlow = '1' then
                case selDisp is
                    when "00" => 
                        tempData <= ssdDisp0;
                        selDispA <= '0';
                        selDispB <= '1';
                        selDispC <= '1';
                        selDispD <= '1';
                        selDisp := selDisp + 1;
                    when "01" => 
                        tempData <= ssdDisp1;
                        selDispA <= '1';
                        selDispB <= '0';
                        selDispC <= '1';
                        selDispD <= '1';
                        selDisp := selDisp + 1;
                    when "10" => 
                        tempData <= ssdDisp2;
                        selDispA <= '1';
                        selDispB <= '1';
                        selDispC <= '0';
                        selDispD <= '1';
                        selDisp := selDisp + 1;
                    when "11" => 
                        tempData <= ssdDisp3;
                        selDispA <= '1';
                        selDispB <= '1';
                        selDispC <= '1';
                        selDispD <= '0';
                        selDisp := selDisp + 1;
                end case;
            end if;
    end process;                            
                

end Behavioral;

