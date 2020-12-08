package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y27:assets%2Fdata%2Flevel1.jsonR2i43144R3R4R5R7R6tgoR0y41:assets%2Fdata%2Fsidescrollingshooter.ogmoR2i9870R3R4R5R8R6tgoR0y33:assets%2Fimages%2FenemyBullet.pngR2i490R3y5:IMAGER5R9R6tgoR0y29:assets%2Fimages%2Fexplode.pngR2i2056R3R10R5R11R6tgoR0y31:assets%2Fimages%2Fexplosion.pngR2i6567R3R10R5R12R6tgoR0y28:assets%2Fimages%2Ffollow.pngR2i1632R3R10R5R13R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R14R6tgoR0y31:assets%2Fimages%2Fparallax1.pngR2i40019R3R10R5R15R6tgoR0y31:assets%2Fimages%2Fparallax2.pngR2i23179R3R10R5R16R6tgoR0y28:assets%2Fimages%2Fplayer.pngR2i24410R3R10R5R17R6tgoR0y34:assets%2Fimages%2FplayerBullet.pngR2i641R3R10R5R18R6tgoR0y29:assets%2Fimages%2Fpowerup.pngR2i2771R3R10R5R19R6tgoR0y27:assets%2Fimages%2Fshoot.pngR2i1871R3R10R5R20R6tgoR0y25:assets%2Fimages%2Fsin.pngR2i3269R3R10R5R21R6tgoR0y27:assets%2Fimages%2Ftiles.pngR2i259R3R10R5R22R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i29883R3R10R5R23R6tgoR2i853680R3y5:MUSICR5y30:assets%2Fmusic%2Fairbattle.mp3y9:pathGroupaR25y30:assets%2Fmusic%2Fairbattle.ogghR6tgoR2i604872R3y5:SOUNDR5R27R26aR25R27hgoR2i127476R3R24R5y27:assets%2Fmusic%2Fending.mp3R26aR29y27:assets%2Fmusic%2Fending.ogghR6tgoR2i89394R3R28R5R30R26aR29R30hgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R31R6tgoR0y24:assets%2FNarrowLines.fntR2i11360R3R4R5R32R6tgoR0y26:assets%2FNarrowLines_0.pngR2i2060R3R10R5R33R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R34R6tgoR2i2114R3R24R5y26:flixel%2Fsounds%2Fbeep.mp3R26aR35y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R24R5y28:flixel%2Fsounds%2Fflixel.mp3R26aR37y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R28R5R36R26aR35R36hgoR2i33629R3R28R5R38R26aR37R38hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R39R40y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R10R5R45R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R10R5R46R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_sidescrollingshooter_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemybullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_explode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_follow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_parallax1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_parallax2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_playerbullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shoot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_sin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_airbattle_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_airbattle_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ending_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_ending_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_narrowlines_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_narrowlines_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1.json") @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/sidescrollingshooter.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_sidescrollingshooter_ogmo extends haxe.io.Bytes {}
@:keep @:image("assets/images/enemyBullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemybullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/explode.png") @:noCompletion #if display private #end class __ASSET__assets_images_explode_png extends lime.graphics.Image {}
@:keep @:image("assets/images/explosion.png") @:noCompletion #if display private #end class __ASSET__assets_images_explosion_png extends lime.graphics.Image {}
@:keep @:image("assets/images/follow.png") @:noCompletion #if display private #end class __ASSET__assets_images_follow_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/parallax1.png") @:noCompletion #if display private #end class __ASSET__assets_images_parallax1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/parallax2.png") @:noCompletion #if display private #end class __ASSET__assets_images_parallax2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/playerBullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_playerbullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/powerup.png") @:noCompletion #if display private #end class __ASSET__assets_images_powerup_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shoot.png") @:noCompletion #if display private #end class __ASSET__assets_images_shoot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/sin.png") @:noCompletion #if display private #end class __ASSET__assets_images_sin_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:file("assets/music/airbattle.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_airbattle_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/airbattle.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_airbattle_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ending.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_ending_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/ending.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_ending_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/NarrowLines.fnt") @:noCompletion #if display private #end class __ASSET__assets_narrowlines_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/NarrowLines_0.png") @:noCompletion #if display private #end class __ASSET__assets_narrowlines_0_png extends lime.graphics.Image {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,8,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
