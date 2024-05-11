# Keelcore-2021-WGF
Kelly-lochbaum Waveguide filters usage for the composition of Keelcore (2021) by Lawrence McGuire. Based on Peter Pabon's WGF patch.

Usage:
(Be advised: Very loud sounds can occur when changing certain parameters in these patches. Wear heaphones at own risk)
MaxMsp is needed to open these files. A free version can be downloaded from the [Cyling'74 webppage](https://cycling74.com/downloads).
1. Open the **TokudaVFModelInGen.maxpat** first. Do not run the DSP yet. Then open **ModeControl.maxpat**. It is advised not to change the values in this **ModeControl.maxpat** as this is known to blow up in amplitude. 
2. Open the maxpatches **OG_DualLatticeInGenImplementation22WithControl.maxpat**  and **OG_Fie1Fie2ControlSpace.maxpat**
3. In the **OG_DualLatticeInGenImplementation22WithControl.maxpat**  you can now play around with adding different excitation signals (~noise, ~saw or from the ~receive tokudaVF object) to the Digital Waveguide filter. Change the reflection at mouth/glottis end, or change the frequency of the ~saw oscillator. If you send the signal from the TokudaVF model, then you can also change the frequency and physical parameters of the vocal fold model (again be advised with changing these last parameters).
4. In **OG_Fie1Fie2ControlSpace.maxpat** you can then control the first and second formant positions independently by either moving vertically or horizontally in the XY-plane. You can also plug in any control signal in the two inlets of the XY-plane. If you want to send in signals, then you can use the snapshot~ object to sample any signal before sending it into the inlets. One can also modify the _nominal area function_ manually or automatically.

---------------------------------------------------------------------------------------------------------
_Some snapshots of the system_

<img width="600" alt="keelcore_kelly" src="https://github.com/hogobogobogo/Keelcore-2021-WGF/assets/28197759/36f8f471-1a7a-4803-a2be-db13e4460879">

<img width="600" alt="keelcore_duallattice" src="https://github.com/hogobogobogo/Keelcore-2021-WGF/assets/28197759/4aa1bff9-bdaa-49d2-8a98-5b7aeb69d886">

<img width="600" alt="keelcore_fiefie2" src="https://github.com/hogobogobogo/Keelcore-2021-WGF/assets/28197759/a6888f0a-1fb1-4c36-b207-3f4098bdc362">
