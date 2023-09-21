# Siemens_FEMAP_Analysis
• The code is intended for the analysis of composite materials in Siemens FEMAP programs. Code is currently configured to consolidate the data based on the MAX values for displacement, stress, and strain for all nodes, elements, and plies/layers of composite object.
• This code was designed for use in an academic capacity. Purpose of this code is to assist 
in the analysis of composite materials in the Siemens FEMAP program. This code was 
tested on a variety of composite geometries including simplistic geometry for validation 
purposes (panels and tubes) and complex geometry with complex loading scenarios 
(boat hull and stringer).
• The MATLAB code is currently designed to identify the maximum values for stress (X/Y/Z 
Normal Stress and XY/YZ/XZ Shear Stress), strain (X/Y/Z Normal Strain and XY/YZ/XZ 
Shear Strain) and deflection (X, Y, and Z directions) for all nodes, elements, and layers 
and consolidate this information into a simple table.
o Some simple vernacular changes could allow the code to analyze for the 
minimum or average values.
• This code only outputs useful information and data if the FEMAP analysis simulation is 
setup and run correctly.
• This code only runs correctly if the table names match
