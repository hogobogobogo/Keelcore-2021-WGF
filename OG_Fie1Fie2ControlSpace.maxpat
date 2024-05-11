{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 5,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 41.0, 84.0, 1213.0, 562.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 18.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 649.230765104293823, 320.5, 38.0, 29.0 ],
					"text" : "t b l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 649.230765104293823, 464.038460850715637, 38.0, 29.0 ],
					"text" : "t b l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 649.230765104293823, 604.012813329696655, 38.0, 29.0 ],
					"text" : "t b l"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 55.128201842308044, 582.948684096336365, 458.0, 48.0 ],
					"text" : "VOWELS&CONSONANTS: phi1 and phi2 are changed: connect to V(x) and disconnect above of V(x)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 55.128201842308044, 475.640997290611267, 403.846138715744019, 48.0 ],
					"text" : "VOWELS: phi1 and phi22 are unchanged: connect to V(x) and disconnect below of V(x)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 62.0, 632.948684096336365, 351.0, 29.0 ],
					"text" : "vexpr $f1*$f2+$f3*$f4+$f5 @scalarmode 1"
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"forceaspect" : 1,
					"id" : "obj-2",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 655.641021132469177, -12.136861410440574, 397.435879707336426, 202.879572101912572 ],
					"pic" : "E:/2021-2022/Documents/Praktischestuff/Sonology/2023-2024/Bach Research/Still&moving images/Screenshot 2024-04-10 215824.png"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-5",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1061.141021132469177, 466.294870495796204, 354.0, 131.0 ],
					"text" : "Test unit for the Voice Synthesis poroject.\nPeter Pabon, Institute of Sonology, \nClass Physical Modeling, April 2015\nModified Lawrence McGuire\nUse it to control the Area coefficients of   the Lattice22 wave guide object"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-8",
					"linecount" : 9,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1061.141021132469177, 250.538448929786682, 502.0, 213.0 ],
					"text" : "Refence: paper sampled for the tract control:\n\n\"Speech synthesis by mapping articulator movement patterns to a shape-based area function model of the vocal tract\"\rBrad H. Story\rDept. of Speech and Hearing Sciences\rUniversity of Arizona\r141st Meeting of the Acoustical Society of America\r4-8 June, 4aSC2, 109(5), 2444\r"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-69",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 137.641021132469177, 948.051259279251099, 580.0, 91.0 ],
					"text" : "0.32921 0.302432 0.69349 1.923974 2.390816 2.41195 2.565504 2.65292 2.651963 2.60764 2.590729 2.467435 2.42 1.611338 0.000001 0.000001 0.222612 0.377288 0.547501 0.619724 0.888413 0.849675 1.249557 1.388124 1.028369"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 884.141021132469177, 982.948698997497559, 103.0, 29.0 ],
					"text" : "s TractArea"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 961.641021132469177, 901.948698997497559, 215.0, 29.0 ],
					"text" : "expr $f1*$f1*3.1415926/4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 884.141021132469177, 941.948698997497559, 74.0, 29.0 ],
					"text" : "pack a f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 884.141021132469177, 858.948698997497559, 207.0, 29.0 ],
					"text" : "combine A 0 @triggers 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "int", "int" ],
					"patching_rect" : [ 1134.141021132469177, 794.948698997497559, 49.0, 29.0 ],
					"text" : "t b i i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1129.141021132469177, 844.948698997497559, 54.0, 29.0 ],
					"text" : "zl.nth"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 1104.141021132469177, 719.948698997497559, 40.0, 29.0 ],
					"text" : "t b i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 1104.141021132469177, 757.948698997497559, 49.0, 29.0 ],
					"text" : "uzi 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1104.141021132469177, 684.948698997497559, 53.0, 29.0 ],
					"text" : "zl.len"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 62.0, 528.48717474937439, 351.0, 29.0 ],
					"text" : "vexpr $f1*$f2+$f3*$f4+$f5 @scalarmode 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 376.25, 12.0, 31.0, 29.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-47",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 649.230765104293823, 684.948698997497559, 390.0, 144.0 ],
					"setminmax" : [ 0.000000999999997, 3.0 ],
					"size" : 25,
					"varname" : "multislider[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 430.0, 157.5, 100.0, 29.0 ],
					"text" : "zl.group 25"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 430.0, 258.5, 100.0, 29.0 ],
					"text" : "zl.group 25"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 428.25, 358.5, 100.0, 29.0 ],
					"text" : "zl.group 25"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 376.25, 53.5, 74.0, 29.0 ],
					"text" : "uzi 25 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 413.25, 21.5, 85.0, 29.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 25,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0.588652 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0.496454 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0.531915 ]
							}
, 							{
								"key" : 3,
								"value" : [ 1.06383 ]
							}
, 							{
								"key" : 4,
								"value" : [ 1.326241 ]
							}
, 							{
								"key" : 5,
								"value" : [ 1.248227 ]
							}
, 							{
								"key" : 6,
								"value" : [ 1.340425 ]
							}
, 							{
								"key" : 7,
								"value" : [ 1.397163 ]
							}
, 							{
								"key" : 8,
								"value" : [ 1.390071 ]
							}
, 							{
								"key" : 9,
								"value" : [ 1.432624 ]
							}
, 							{
								"key" : 10,
								"value" : [ 1.496454 ]
							}
, 							{
								"key" : 11,
								"value" : [ 1.453901 ]
							}
, 							{
								"key" : 12,
								"value" : [ 1.446808 ]
							}
, 							{
								"key" : 13,
								"value" : [ 1.411348 ]
							}
, 							{
								"key" : 14,
								"value" : [ 1.319149 ]
							}
, 							{
								"key" : 15,
								"value" : [ 1.368794 ]
							}
, 							{
								"key" : 16,
								"value" : [ 1.539007 ]
							}
, 							{
								"key" : 17,
								"value" : [ 1.730496 ]
							}
, 							{
								"key" : 18,
								"value" : [ 1.900709 ]
							}
, 							{
								"key" : 19,
								"value" : [ 2.049645 ]
							}
, 							{
								"key" : 20,
								"value" : [ 1.914894 ]
							}
, 							{
								"key" : 21,
								"value" : [ 1.553192 ]
							}
, 							{
								"key" : 22,
								"value" : [ 1.347518 ]
							}
, 							{
								"key" : 23,
								"value" : [ 1.163121 ]
							}
, 							{
								"key" : 24,
								"value" : [ 1.028369 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 430.0, 125.0, 59.5, 29.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll Ω"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 25,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ -0.022 ]
							}
, 							{
								"key" : 3,
								"value" : [ -0.046 ]
							}
, 							{
								"key" : 4,
								"value" : [ -0.072 ]
							}
, 							{
								"key" : 5,
								"value" : [ -0.106 ]
							}
, 							{
								"key" : 6,
								"value" : [ -0.142 ]
							}
, 							{
								"key" : 7,
								"value" : [ -0.174 ]
							}
, 							{
								"key" : 8,
								"value" : [ -0.196 ]
							}
, 							{
								"key" : 9,
								"value" : [ -0.21 ]
							}
, 							{
								"key" : 10,
								"value" : [ -0.196 ]
							}
, 							{
								"key" : 11,
								"value" : [ -0.154 ]
							}
, 							{
								"key" : 12,
								"value" : [ -0.088 ]
							}
, 							{
								"key" : 13,
								"value" : [ 0 ]
							}
, 							{
								"key" : 14,
								"value" : [ 0.08 ]
							}
, 							{
								"key" : 15,
								"value" : [ 0.158 ]
							}
, 							{
								"key" : 16,
								"value" : [ 0.232 ]
							}
, 							{
								"key" : 17,
								"value" : [ 0.266 ]
							}
, 							{
								"key" : 18,
								"value" : [ 0.272 ]
							}
, 							{
								"key" : 19,
								"value" : [ 0.238 ]
							}
, 							{
								"key" : 20,
								"value" : [ 0.172 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0.108 ]
							}
, 							{
								"key" : 22,
								"value" : [ 0.054 ]
							}
, 							{
								"key" : 23,
								"value" : [ 0.042 ]
							}
, 							{
								"key" : 24,
								"value" : [ 0.07 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 430.0, 223.0, 63.0, 29.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll ϕ1"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 25,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0.02 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0.038 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0.088 ]
							}
, 							{
								"key" : 4,
								"value" : [ 0.13 ]
							}
, 							{
								"key" : 5,
								"value" : [ 0.134 ]
							}
, 							{
								"key" : 6,
								"value" : [ 0.112 ]
							}
, 							{
								"key" : 7,
								"value" : [ 0.08 ]
							}
, 							{
								"key" : 8,
								"value" : [ 0.044 ]
							}
, 							{
								"key" : 9,
								"value" : [ 0 ]
							}
, 							{
								"key" : 10,
								"value" : [ -0.05 ]
							}
, 							{
								"key" : 11,
								"value" : [ -0.098 ]
							}
, 							{
								"key" : 12,
								"value" : [ -0.154 ]
							}
, 							{
								"key" : 13,
								"value" : [ -0.2 ]
							}
, 							{
								"key" : 14,
								"value" : [ -0.214 ]
							}
, 							{
								"key" : 15,
								"value" : [ -0.198 ]
							}
, 							{
								"key" : 16,
								"value" : [ -0.156 ]
							}
, 							{
								"key" : 17,
								"value" : [ -0.058 ]
							}
, 							{
								"key" : 18,
								"value" : [ 0.052 ]
							}
, 							{
								"key" : 19,
								"value" : [ 0.158 ]
							}
, 							{
								"key" : 20,
								"value" : [ 0.2 ]
							}
, 							{
								"key" : 21,
								"value" : [ 0.136 ]
							}
, 							{
								"key" : 22,
								"value" : [ 0.054 ]
							}
, 							{
								"key" : 23,
								"value" : [ 0.042 ]
							}
, 							{
								"key" : 24,
								"value" : [ 0.072 ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 428.25, 320.5, 63.0, 29.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1,
						"precision" : 6
					}
,
					"text" : "coll ϕ2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-30",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 174.0, 347.0, 31.0, 27.0 ],
					"text" : "ϕ1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-29",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 364.0, 347.0, 31.0, 27.0 ],
					"text" : "ϕ2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 573.730765104293823, 741.948698997497559, 43.0, 27.0 ],
					"text" : "V(x)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 595.230765104293823, 537.794870495796204, 52.0, 27.0 ],
					"text" : "ϕ2(x)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 595.230765104293823, 394.846153616905212, 52.0, 27.0 ],
					"text" : "ϕ1(x)"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-22",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 649.230765104293823, 505.294870495796204, 384.0, 92.0 ],
					"setminmax" : [ -0.400000005960464, 0.400000005960464 ],
					"size" : 25,
					"varname" : "multislider[2]"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-21",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 649.230765104293823, 362.346153616905212, 384.0, 92.0 ],
					"setminmax" : [ -0.400000005960464, 0.400000005960464 ],
					"size" : 25,
					"varname" : "multislider[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 595.230765104293823, 249.012822270393372, 50.5, 27.0 ],
					"text" : "Ω(x)"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-25",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 649.230765104293823, 216.512822270393372, 384.0, 92.0 ],
					"setminmax" : [ 0.000000999999997, 3.0 ],
					"size" : 25,
					"varname" : "multislider"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 113.105269193649292, 22.5, 186.789461612701416, 27.0 ],
					"text" : "c1=modal coefficient"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 253.0, 309.0, 147.0, 29.0 ],
					"text" : "scale 0 127 -3. 3."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 62.0, 309.0, 147.0, 29.0 ],
					"text" : "scale 0 127 -6. 5."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 11.578948020935059, 186.736842513084412, 70.999996900558472, 27.0 ],
					"text" : "c2=\"\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"format" : 6,
					"id" : "obj-4",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 253.0, 347.0, 105.0, 29.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"format" : 6,
					"id" : "obj-3",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 62.0, 347.0, 105.0, 29.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 62.0, 49.5, 289.0, 245.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"order" : 1,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"order" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 1 ],
					"source" : [ "obj-37", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 2 ],
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 2 ],
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"order" : 2,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"order" : 1,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 1,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 3 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 1,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 1,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 4 ],
					"order" : 1,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 4 ],
					"order" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"order" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 1 ],
					"order" : 1,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 3 ],
					"source" : [ "obj-53", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-54", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 4 ],
					"source" : [ "obj-56", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 1 ],
					"source" : [ "obj-59", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.96078431372549, 0.43921568627451, 0.47843137254902, 1.0 ],
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-61", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "Screenshot 2024-04-10 215824.png",
				"bootpath" : "E:/2021-2022/Documents/Praktischestuff/Sonology/2023-2024/Bach Research/Still&moving images",
				"patcherrelativepath" : "../../Still&moving images",
				"type" : "PNG",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"boxgroups" : [ 			{
				"boxes" : [ "obj-26", "obj-21" ]
			}
, 			{
				"boxes" : [ "obj-27", "obj-22" ]
			}
, 			{
				"boxes" : [ "obj-25", "obj-17" ]
			}
 ]
	}

}
