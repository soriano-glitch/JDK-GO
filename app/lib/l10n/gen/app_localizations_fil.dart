// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class L10nFil extends L10n {
  L10nFil([String locale = 'fil']) : super(locale);

  @override
  String get a11yRestoreTitle => 'Awtomatikong ibalik ang accessibility';

  @override
  String get searchKwA11yRestore =>
      'accessibility,ibalik,muling kumonekta,awtomatikong pagbawi,pahintulot,ADB,Shizuku,Sui,root,restore,reconnect';

  @override
  String get a11yRestoreNeedsGrant => 'Kailangan ng awtorisasyon';

  @override
  String get a11yRestoreNotice =>
      'Kapag naawtorisahan, muling bubuksan ang accessibility kung ito ay na-disable sa system settings. Para ihinto ang phone control, patayin ito sa JDK-Go.';

  @override
  String get a11yRestoreForceStop => 'Pagkatapos ng force stop, buksan muli ang JDK-Go para maibalik ang serbisyo.';

  @override
  String get a11yRestoreGrant => 'Mag-authorize at i-enable';

  @override
  String get a11yRestoreGrantShizuku => 'Ipagkaloob gamit ang Shizuku';

  @override
  String get a11yRestoreGrantShizukuPermission => 'I-authorize ang Shizuku, saka ipagkaloob';

  @override
  String get a11yRestoreGrantAdb => 'Ipagkaloob gamit ang Direct ADB';

  @override
  String get a11yRestoreRootNote =>
      'Ginagamit ang awtorisadong root na koneksyon para ipagkaloob lamang ang pahintulot na ito.';

  @override
  String get a11yRestoreSetup => 'I-set up ang Shizuku o wireless debugging';

  @override
  String get a11yRestoreWaiting => 'Payagan ang kahilingan sa Shizuku';

  @override
  String get a11yRestoreWaitingSui => 'Payagan ang kahilingan sa Sui';

  @override
  String get a11yRestoreComputer => 'O kumonekta sa computer at patakbuhin nang isang beses:';

  @override
  String get a11yRestoreCopy => 'Kopyahin ang command';

  @override
  String get a11yRestoreCopied => 'Nakopya ang command';

  @override
  String get accessPickTitle => 'Saan dapat tumulong ang JDK-Go?';

  @override
  String get accessPickMessage => 'Pumili ng anuman, saka i-on ang bawat isa';

  @override
  String get accessPickConfirm => 'I-on ang mga napili';

  @override
  String get accessSkip => 'Laktawan';

  @override
  String get accessFeatureFiles => 'Magbasa at magsulat ng mga file ng telepono';

  @override
  String get accessFeatureFilesNeeds => 'Kailangan ng access sa file';

  @override
  String get accessFeaturePet => 'Pet sa ibabaw ng ibang app';

  @override
  String get accessFeaturePetNeeds => 'Kailangan ng display over other apps';

  @override
  String get accessFeaturePhone => 'Phone control';

  @override
  String get accessFeaturePhoneNeeds => 'Kailangan ng accessibility at mga notification';

  @override
  String get accessFeatureBackground => 'Panatilihing tumatakbo sa background';

  @override
  String get accessFeatureBackgroundNeeds =>
      'Sinasabi sa iyo kapag tapos na ang mga gawain; kailangan ng mga notification at background access';

  @override
  String get accessFeatureVoice => 'Voice input';

  @override
  String get accessFeatureVoiceNeeds => 'Kailangan ng mikropono';

  @override
  String accessVoiceModel(int size) {
    return 'Gumagana offline; nagda-download ng voice model na humigit-kumulang $size MB';
  }

  @override
  String get accessVoiceMetered => 'Nasa mobile data ka; gagamitin ito ng pag-download';

  @override
  String get accessFilesRiskBody => 'Nababasa at nababago ng AI ang iyong mga larawan, download at dokumento.';

  @override
  String accessStepCount(int index, int total) {
    return '$index / $total';
  }

  @override
  String get accessTurnOn => 'I-on';

  @override
  String get accessOpenSettings => 'Buksan ang settings';

  @override
  String get accessItsSet => 'Nakatakda na';

  @override
  String get accessOpenAgain => 'Buksan muli';

  @override
  String get accessIsOn => 'Naka-on';

  @override
  String get accessNotOnYet => 'Hindi pa naka-on';

  @override
  String get accessDidYouSet => 'Na-on mo ba doon?';

  @override
  String accessWhere(String path) {
    return 'Saan: $path';
  }

  @override
  String get accessOpenFailed => 'Hindi mabuksan ang system settings';

  @override
  String get accessMicTitle => 'Payagan ang mikropono';

  @override
  String get accessMicWhy => 'Para sa voice input';

  @override
  String get accessStorageTitle => 'Payagan ang access sa file';

  @override
  String get accessStorageWhy => 'Hinahayaan ang AI na magbasa at magsulat ng mga larawan, download at dokumento';

  @override
  String get accessNotifyTitle => 'Payagan ang mga notification';

  @override
  String get accessNotifyWhy => 'Sinasabi sa iyo kapag tapos na ang gawain o kailangan ka';

  @override
  String get accessBatteryTitle => 'Payagan ang pagtakbo sa background';

  @override
  String get accessBatteryWhy => 'Nagpapatuloy ang mga gawain kapag lumipat ka ng app';

  @override
  String get accessVendorBackgroundWhy => 'Pinipigilan ang system na putulin ang mga gawain sa background';

  @override
  String get accessAutostartTitle => 'Payagan ang auto-start';

  @override
  String get accessAutostartWhy => 'Hinahayaan ang JDK-Go na bumalik pagkatapos itong linisin ng system';

  @override
  String accessVivoAutostartPath(String app) {
    return 'Permission management › Auto-start › $app';
  }

  @override
  String accessXiaomiAutostartPath(String app) {
    return 'Manage apps › $app › Autostart';
  }

  @override
  String get accessA11yTitle => 'I-on ang accessibility';

  @override
  String get accessA11yWhy => 'Binabasa ng phone control ang screen at nagta-tap dito';

  @override
  String get accessPopupTitle => 'Payagan ang mga pop-up sa background';

  @override
  String get accessPopupWhy => 'Ibinabalik ka sa JDK-Go kapag tapos na ang phone control';

  @override
  String accessVivoPopupPath(String app) {
    return 'Permission management › $app › Display pop-up windows in background';
  }

  @override
  String accessXiaomiPopupPath(String app) {
    return 'Manage apps › $app › Other permissions › Display pop-up windows while running in the background';
  }

  @override
  String get accessOverlayTitle => 'Payagan ang display over other apps';

  @override
  String get accessOverlayWhy => 'Hinahayaan ang iyong pet na lumabas sa ibabaw ng ibang app';

  @override
  String get accessOverlayGreyed => 'Kulay-abo ang switch?';

  @override
  String get accessRestrictedTitle => 'Payagan muna ang restricted settings';

  @override
  String get accessRestrictedTap =>
      'Sa Accessibility, i-tap ang “JDK Phone Control”; kapag lumabas ang “Restricted setting”, i-tap ang OK';

  @override
  String get accessRestrictedMenu =>
      'Sa App info, i-tap ang tatlong tuldok sa kanang itaas at piliin ang “Allow restricted settings”';

  @override
  String get accessRestrictedAdvanced =>
      'Sa App info, buksan ang “Advanced settings” at i-on ang “Allow restricted settings”';

  @override
  String get accessRestrictedBack => 'Pagbalik sa Accessibility, i-on ang “JDK Phone Control”';

  @override
  String get accessRestrictedHelp => 'Tingnan kung paano';

  @override
  String get accessOpenA11y => 'Buksan ang accessibility';

  @override
  String get accessOpenAppInfo => 'Buksan ang app info';

  @override
  String get accessStateOn => 'Naka-on';

  @override
  String get accessStateOff => 'Naka-off';

  @override
  String get accessStateVisited => 'Nabisita';

  @override
  String get accessStateUnknown => 'I-set up';

  @override
  String get accessSummaryAllSet => 'Handa na lahat';

  @override
  String accessSummaryLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ang naka-off pa',
      one: '1 ang naka-off pa',
    );
    return '$_temp0';
  }

  @override
  String get accessSummaryMessage => 'I-on ang iba anumang oras sa Settings › General › System permissions';

  @override
  String get accessFinishFailed => 'Hindi natapos ang setup';

  @override
  String accessVoiceDownload(int size) {
    return 'Magsisimulang mag-download ang voice model (humigit-kumulang $size MB) kapag handa na ang engine. Subaybayan ito sa Settings › General › Voice input.';
  }

  @override
  String get accessPageTitle => 'Mga system permission';

  @override
  String get accessPageSubtitle => 'Ang kailangan ng bawat feature mula sa Android';

  @override
  String get activityThinkingUntangle => 'Hmm… lilinawin ko ito';

  @override
  String get activityThinkingWorkThrough => 'Pag-isipan natin ito';

  @override
  String get activityThinkingGears => 'Umiikot ang mga gear sa utak';

  @override
  String get activityThinkingSecond => 'Sandali lang';

  @override
  String get activityThinkingSmoking => 'Nag-o-overtime ang utak ko';

  @override
  String get activityThinkingOnIt => 'Nag-iisip, nag-iisip';

  @override
  String get activityThinkingNoRush => 'Isang ideya sa isang pagkakataon';

  @override
  String get activityThinkingPonder => 'Pag-iisipan ko iyan';

  @override
  String get activityThinkingLogic => 'Pinag-aaralan ang lohika';

  @override
  String get activityThinkingBrain => 'Pinapagana ang utak ko';

  @override
  String get activityThinkingSort => 'Aayusin ko ito';

  @override
  String get activityThinkingMemory => 'Hinahalungkat ang alaala ko';

  @override
  String get activityThinkingStorm => 'Nag-brainstorm';

  @override
  String get activityThinkingSavor => 'Hmm… hayaang lumubog sa isip';

  @override
  String get activityThinkingMoment => 'Sandali, nag-iisip';

  @override
  String get activityThinkingHeadScratch => 'Napapakamot sa ulo…';

  @override
  String get activityThinkingPlayOut => 'Tingnan natin kung saan ito aabot';

  @override
  String get activityThinkingLoading => 'Naglo-load ang mga ideya';

  @override
  String get activityThinkingMulling => 'Pinag-iisipan itong mabuti';

  @override
  String get activityThinkingBreakDown => 'Hmm… hahatiin ko ito';

  @override
  String get activityThinkingTrain => 'Sakay na sa tren ng pag-iisip';

  @override
  String get activityThinkingSomething => 'Hmm… may kakaiba rito';

  @override
  String get activityThinkingJog => 'Ini-jogging ang ideyang ito';

  @override
  String get activityThinkingPicture => 'Teka, nakikita ko na';

  @override
  String get activityThinkingBubbles => 'Mga thought bubble';

  @override
  String get activityThinkingWaves => 'Paparating na ang mga brainwave';

  @override
  String get activityThinkingCoffee => 'Nagtitimpla ng kape ang utak ko';

  @override
  String get activityThinkingDraft => 'Sinusulat sa isip';

  @override
  String get activityThinkingComing => 'Ah, naaalala ko na';

  @override
  String get activityThinkingBubbling => 'Lumilitaw ang mga ideya';

  @override
  String get activityThinkingTackle => 'Hmm… harapin natin ito';

  @override
  String get activityThinkingSpark => 'Isang kislap ng ideya';

  @override
  String get activityThinkingLogicFirst => 'Ayusin muna natin ang lohika';

  @override
  String get activityThinkingLocate => 'Tinutukoy ito';

  @override
  String get activityThinkingInvestigate => 'Sinisiyasat ito';

  @override
  String get activityThinkingGif => 'thinking.gif';

  @override
  String get activityThinkingLook => 'Silipin ko lang';

  @override
  String get activityThinkingInteresting => 'Hmm… kawili-wili';

  @override
  String get activityThinkingHands => 'Nag-iinit ang utak ko';

  @override
  String get activityThinkingFiveMinutes => 'Limang minuto. Medyo malaking proyekto';

  @override
  String get activityThinkingSerious => 'Oras na para seryosohin';

  @override
  String get activityThinkingTricky => 'Medyo mahirap ito';

  @override
  String get activityThinkingAscend => 'Umaabot sa mas mataas na antas';

  @override
  String get activityThinkingAlmostPromise => 'Malapit na, pangako';

  @override
  String get activityThinkingLongWay => 'Dumaan sa mahabang ruta';

  @override
  String get activityThinkingWrapping => 'Tinatapos na';

  @override
  String get activityThinkingSong => 'Bigyan mo ako ng isang kanta';

  @override
  String get activityThinkingBigMove => 'Inihahanda ang malaking hakbang';

  @override
  String get activityThinkingSimple => 'Madaling hiling. O hindi ba?';

  @override
  String get activityThinkingOneMinute => 'Isang minuto, nag-iisip pa';

  @override
  String get activityThinkingChallenge => 'Ngayon, hamon iyan';

  @override
  String get activityThinkingDig => 'Hukayin ko pa nang kaunti';

  @override
  String get activityThinkingNotSimple => 'May iba pang bahagi rito';

  @override
  String get activityThinkingDeep => 'Lumulubog na sa malalim na pag-iisip';

  @override
  String get activityThinkingBurning => 'Nagpapaputok ang mga brain cell';

  @override
  String get activityThinkingNearlyClear => 'Halos naiisip ko na';

  @override
  String get activityThinkingTwisty => 'Medyo pasikot-sikot ito…';

  @override
  String get activityThinkingWorkout => 'Pinag-eehersisyo ang utak ko…';

  @override
  String get activityThinkingStay => 'Samahan mo ako, malapit na';

  @override
  String get activityThinkingCloser => 'Pag-isipan kong mabuti ito';

  @override
  String get activityThinkingThirtySeconds => 'Tatlumpung segundo, ginagawa pa rin';

  @override
  String get activityThinkingSoon => 'Sandali lang, malapit na';

  @override
  String get activityThinkingAnotherPass => 'Subukan ko ulit';

  @override
  String get activityThinkingTrack => 'Nasa tamang landas pa rin';

  @override
  String get activityThinkingLead => 'May nararating na';

  @override
  String get activityThinkingCircles => 'Umiikot lang…';

  @override
  String get activityThinkingAnyMoment => 'Anumang sandali ngayon';

  @override
  String get activityThinkingStillLocate => 'Pinaliliit pa rin';

  @override
  String get activityWaitingCall => 'Tinatawag ang model…';

  @override
  String get activityWaitingOnWay => 'Paparating na ang model';

  @override
  String get activityWaitingSpeak => 'Naghihintay ng salita…';

  @override
  String get activityWaitingWords => 'Hinahanap ang tamang salita';

  @override
  String get activityWaitingAwake => 'Gising na ba ang model?';

  @override
  String get activityWaitingStretch => 'Hinahayaang mag-unat';

  @override
  String get activityWaitingYawn => 'Humikab ang model';

  @override
  String get activityWaitingComing => 'Model: papunta na ako';

  @override
  String get activityWaitingText => 'Naghihintay sa unang mga salita';

  @override
  String get activityWaitingQueue => 'Nasa pila pa rin';

  @override
  String get activityWaitingBrew => 'May niluluto';

  @override
  String get activityWaitingWater => 'Humihigop ang model';

  @override
  String get activityWaitingWarmup => 'Hinahayaang uminit';

  @override
  String get activityWaitingMeditate => 'Nagme-meditate ang model';

  @override
  String get activityWaitingBlink => 'Naghihintay na kumurap ito';

  @override
  String get activityWaitingMoment => 'Sabi nito, “sandali lang”';

  @override
  String get activityWritingWords => 'Hinahanap ang mga salita';

  @override
  String get activityWritingTyping => 'Nagta-type';

  @override
  String get activityWritingInspired => 'Dumadaloy ang mga salita na parang mahika';

  @override
  String get activityWritingOnIt => 'Sumusulat, sumusulat';

  @override
  String get activityWritingCareful => 'Pinipili ang bawat salita';

  @override
  String get activityWritingFlow => 'Lahat sa isang daloy';

  @override
  String get activityWritingPlain => 'Isinusulat sa simpleng salita';

  @override
  String get activityWritingIdeas => 'Ginagawang salita ang mga ideya';

  @override
  String get activityWritingKeys => 'Tap-tap-tap';

  @override
  String get activityWritingAlmost => 'Halos tapos nang sumulat';

  @override
  String get activityWritingTell => 'Sasabihin ko sa iyo';

  @override
  String get activityWritingFast => 'Sumusulat nang buong sigla';

  @override
  String get activityWritingBreeze => 'Lumilipad ang mga salita sa pahina';

  @override
  String get activityWritingFormat => 'Inaayos ang layout';

  @override
  String get activityNightAscend => 'Lampas na sa oras ng tulog…';

  @override
  String get activityNightHello => 'Maliit na hello sa hatinggabi';

  @override
  String get activityNightOwl => 'Puyat ka rin pala?';

  @override
  String get activityNightMoon => 'Kung gising ang buwan, gising ako';

  @override
  String get activityNightSlow => 'Utak sa hatinggabi, dahan-dahan lang';

  @override
  String get activityNightChampion => 'Online na ang kampeon ng puyatan';

  @override
  String get activityNightSleepy => 'Antok na, pero kaya ko ito';

  @override
  String get activityNightMidnight => 'Tuloy pa rin lampas hatinggabi';

  @override
  String get activityNightOpen => 'Bukas para sa night shift';

  @override
  String get activityNightStars => 'Natutulog na pati mga bituin';

  @override
  String get activityNightDawn => 'Nag-iisip hanggang madaling-araw';

  @override
  String get activityWeekendChill => 'Kaunting weekend chill';

  @override
  String get activityWeekendHere => 'Narito rin tuwing weekend!';

  @override
  String get activityWeekendCompany => 'Narito rin tuwing day off';

  @override
  String get activityWeekendOnline => 'Walang weekend shutdown';

  @override
  String get activityWeekendSneak => 'Palihim na pag-iisip sa weekend';

  @override
  String get activityWeekendWorking => 'Nagtatrabaho rin sa weekend?';

  @override
  String get activityWeekendMode => 'Naka-ON ang weekend mode';

  @override
  String get activityWeekendBugs => 'Pag-aayos ng bug sa weekend';

  @override
  String get activityWeekendSkin => 'Tingin na pang-weekend lang';

  @override
  String get activityNewYearCheers => 'Manigong Bagong Taon!';

  @override
  String get activityNewYearDay => 'Manigong Bagong Taon';

  @override
  String get activityNewYearBugs => 'Bagong taon, bagong bug';

  @override
  String get activityNewYearFirstLine => 'Unang linya ng code ngayong taon';

  @override
  String get activityNewYearWork => 'Para sa magandang simula';

  @override
  String get activityValentineCode => 'Nagko-code rin sa Valentine’s Day';

  @override
  String get activityValentineLove => 'Ang code ang tunay na pag-ibig';

  @override
  String get activityValentineDate => 'Walang date ngayon?';

  @override
  String get activityValentineKeyboard => 'Ang mga keyboard ang aking mga rosas';

  @override
  String get activityPiDay => 'Maligayang π Day';

  @override
  String get activityPiCircle => 'Mas bilog ang mga bilog ngayon';

  @override
  String get activityAprilFools => 'Maligayang April Fools’ Day';

  @override
  String get activityAprilBug => 'Biro lang ang bug na ito, di ba?';

  @override
  String get activityAprilErrors => 'Mag-ingat sa mga prank na error';

  @override
  String get activityAprilKidding => 'Biro lang, walang error';

  @override
  String get activityLaborWorking => 'Nagtatrabaho pa rin sa Labor Day';

  @override
  String get activityLaborPride => 'Kaunting pagmamalaki sa trabaho';

  @override
  String get activityLaborSpirit => 'Worker mode: todo-bigay';

  @override
  String get activityChildrenDay => 'Maligayang Araw ng mga Bata';

  @override
  String get activityChildrenHeart => 'Mga bata pa rin tayo sa puso';

  @override
  String get activityChildrenCode => 'Cute na code lang ngayon';

  @override
  String get activityProgrammerCheers => 'Maligayang 1024 Programmers’ Day';

  @override
  String get activityProgrammerDay => 'Programmers’ Day ngayon';

  @override
  String get activityProgrammer1024 => '1024, maligayang araw ng pagko-code';

  @override
  String get activityProgrammerCode => 'Nagko-code rin sa ating holiday';

  @override
  String get activityHalloween => 'Maligayang Halloween';

  @override
  String get activityHalloweenTreat => 'Trick or treat';

  @override
  String get activityHalloweenCode => 'Nakakatakot din ang code';

  @override
  String get activityChristmasEve => 'Maligayang Noche Buena';

  @override
  String get activityChristmasEveThinking => 'Nag-iisip din sa Noche Buena';

  @override
  String get activityChristmasEveGift => 'Mag-code ngayong gabi, may regalong naghihintay';

  @override
  String get activityChristmas => 'Maligayang Pasko';

  @override
  String get activityChristmasCompany => 'Narito ako kasama mo ngayong Pasko';

  @override
  String get activityChristmasEgg => 'Easter egg na pang-Pasko lang';

  @override
  String get activityChristmasReindeer => 'Naghahatid ng code ang mga reindeer';

  @override
  String get activityYearEndEve => 'Bisperas ng Bagong Taon';

  @override
  String get activityYearEndLast => 'Isang huling pag-iisip ngayong taon';

  @override
  String get activityYearEndReady => 'Handa na para sa bagong taon';

  @override
  String get activityYearEndSeeYou => 'Kita-kits sa susunod na taon!';

  @override
  String get activityZodiacRat => 'Daga';

  @override
  String get activityZodiacOx => 'Baka';

  @override
  String get activityZodiacTiger => 'Tigre';

  @override
  String get activityZodiacRabbit => 'Kuneho';

  @override
  String get activityZodiacDragon => 'Dragon';

  @override
  String get activityZodiacSnake => 'Ahas';

  @override
  String get activityZodiacHorse => 'Kabayo';

  @override
  String get activityZodiacGoat => 'Kambing';

  @override
  String get activityZodiacMonkey => 'Unggoy';

  @override
  String get activityZodiacRooster => 'Tandang';

  @override
  String get activityZodiacDog => 'Aso';

  @override
  String get activityZodiacPig => 'Baboy';

  @override
  String get activityLunarCheers => 'Maligayang Lunar New Year!';

  @override
  String get activityLunarCode => 'Nagko-code pa rin sa Bagong Taon';

  @override
  String get activityLunarEnvelope => 'Mga pulang sobre, pakiusap';

  @override
  String get activityLunarSpring => 'Maligayang Spring Festival';

  @override
  String get activityLunarGreeting => 'Pagbati sa Bagong Taon';

  @override
  String get activityLunarCodeGreeting => 'Sabi ng code, Manigong Bagong Taon';

  @override
  String get activityRareSsr => 'SSR! Bihirang Easter egg';

  @override
  String get activityRareUr => 'UR drop';

  @override
  String get activityRareLegend => 'Legendary drop!';

  @override
  String get activityRareOrange => 'Isang orange-tier na drop';

  @override
  String get activityRareEgg => 'May Easter egg na nakahanap sa iyo';

  @override
  String get activityRareChosen => 'Ang piling sandali';

  @override
  String get activityRareHidden => 'Natagpuan mo ang nakatagong edisyon';

  @override
  String get activityRareChat => 'Na-unlock ang lihim na chat';

  @override
  String get activityRareMax => 'Rarity MAX';

  @override
  String get activityRareLucky => 'Pabor sa iyo ang swerte';

  @override
  String get activityRareCritical => 'Critical hit';

  @override
  String get activityRareNextLevel => 'Pag-iisip na next-level';

  @override
  String get activityFailCrash => 'Ayun, nagkamali pala';

  @override
  String get activityFailOops => 'Ay';

  @override
  String get activityFailRun => 'Hindi tumakbo iyon';

  @override
  String get activityFailTrip => 'Kaunting pagkatisod';

  @override
  String get activityFailWrong => 'Hindi tama iyon';

  @override
  String get activityFailHiccup => 'Nagka-aberya';

  @override
  String get activityFailBroken => 'Hindi gumagana iyon';

  @override
  String get activityFailLocal => 'Gumagana naman sa akin';

  @override
  String get activityFailYesterday => 'Gumana ito kahapon';

  @override
  String get activityFailTough => 'Mahirap iyan';

  @override
  String get activityFailCrack => 'Ayun, nasira';

  @override
  String get activityFailPressure => 'Nararamdaman ang pressure';

  @override
  String get activityFailCareless => 'Medyo nagkamali ako roon';

  @override
  String get activityFailSlip => 'Madulas ang mga daliri';

  @override
  String get activityFailTryAgain => 'Subukan natin ang ibang paraan';

  @override
  String get activityFailChance => 'Bigyan mo ako ng isa pang pagkakataon';

  @override
  String get activityTestGreen => 'Berde lahat ng test';

  @override
  String get activityTestAllGreen => 'Berde lahat. Ayos';

  @override
  String get activityTestFirstTry => 'Pumasa sa unang subok!';

  @override
  String get activityTestNoErrors => 'Walang error';

  @override
  String get activityTestPassed => 'Pumasa ito!';

  @override
  String get activityTestSolid => 'Mukhang matibay';

  @override
  String get activityTestRed => 'Pula. Tingnan natin kung ano ang nasira';

  @override
  String get activityTestInvestigate => 'Bumagsak ang mga test. Sinisiyasat';

  @override
  String get activityTestStubborn => 'Isang matigas na test';

  @override
  String get activityTestFix => 'Pulang ilaw. Balik sa pag-aayos';

  @override
  String get activityGitCommitSave => 'Na-commit. Nai-save ang progreso';

  @override
  String get activityGitSaved => 'Nai-save ang progreso';

  @override
  String get activityGitCommitRelief => 'Na-commit. Kapanatagan ng loob';

  @override
  String get activityGitPushed => 'Na-push';

  @override
  String get activityGitPushDone => 'Na-push. Aalis na ito';

  @override
  String get activityGitCodeOut => 'Lumabas na ang code';

  @override
  String get activityInstallDone => 'Na-install ang mga dependency';

  @override
  String get activityInstallInternet => 'Na-download ang kalahati ng internet';

  @override
  String get activityInstallPackages => 'Naroon lahat ng package';

  @override
  String get activityMilestoneFive => 'Mga tool x5, nagsisimula nang sumabay';

  @override
  String get activityMilestoneTen => 'Combo ng mga tool x10';

  @override
  String get activityMilestoneTwenty => 'Mga tool x20, tuloy-tuloy';

  @override
  String get activityMilestoneFifty => 'Mga tool x50, nag-o-overtime';

  @override
  String get activityRetryWait => 'Sandali lang, sinusubukang muli';

  @override
  String get activityRetryBackoff => 'Tinanggihan. Umaatras muna';

  @override
  String get activityRetryKnock => 'Kakatok ulit';

  @override
  String get activityRateLimited => 'Naabot ang rate limit. Magpapahinga muna';

  @override
  String get activityRate429 => '429. Hinga muna, saka subukang muli';

  @override
  String get activityRateQueue => 'Ang haba ng pila ngayon';

  @override
  String get activityCompactContext => 'Inaayos ang context…';

  @override
  String get activityCompactBag => 'Inaayos ang backpack ko…';

  @override
  String get activityCompactSpace => 'Gumagawa ng espasyo';

  @override
  String get activityCompactMemory => 'Pinupungusan ang memorya ko';

  @override
  String get activityCompactChats => 'Iniimpake ang mga lumang chat';

  @override
  String get activityReminderWater => 'Kalahating oras na. Magpahinga para uminom ng tubig?';

  @override
  String get activityReminderTenMinutes => 'Sampung minuto. Medyo malaking gawain';

  @override
  String get activityDiffTitle => 'Nagbabago ang turn';

  @override
  String get activityDiffCopied => 'Nakopya ang patch';

  @override
  String get activityDiffNoWrap => 'Huwag i-wrap ang mga linya';

  @override
  String get activityDiffWrap => 'I-wrap ang mga linya';

  @override
  String get activityDiffCopy => 'Kopyahin ang patch';

  @override
  String get activityDiffEmpty => 'Walang laman ang file, walang pagbabagong ipapakita';

  @override
  String get activityDiffNewFile => 'Bagong file';

  @override
  String get activityDiffUnknownLines => 'Hindi alam ang mga numero ng linya';

  @override
  String get activityDiffCopyPath => 'Kopyahin ang path';

  @override
  String get activityThinking => 'Nag-iisip';

  @override
  String get activityReplyInterrupted => 'Sagot (naantala)';

  @override
  String get activityWaitingApproval => 'Naghihintay ng pag-apruba';

  @override
  String get activityWaitingAnswer => 'Naghihintay ng sagot';

  @override
  String get activityWriting => 'Sumusulat ng sagot';

  @override
  String get activityThinkingNow => 'Nag-iisip';

  @override
  String get activityRetrying => 'Sinusubukang muli';

  @override
  String get activityCompacting => 'Kino-compact ang context';

  @override
  String get activityVerbRun => 'Takbo';

  @override
  String get activityVerbWrite => 'Sulat';

  @override
  String get activityVerbEdit => 'Edit';

  @override
  String get activityVerbImage => 'Tingnan ang larawan';

  @override
  String get activityVerbRead => 'Basa';

  @override
  String get activityVerbFind => 'Hanap';

  @override
  String get activityVerbSearch => 'Maghanap';

  @override
  String get activityVerbWebSearch => 'Maghanap sa web';

  @override
  String get activityVerbWebView => 'Tingnan ang web';

  @override
  String get activityVerbSubagent => 'Magpadala ng subagent';

  @override
  String get activityVerbTodo => 'I-update ang mga to-do';

  @override
  String get activitySecretHide => 'Itago ang key';

  @override
  String get activitySecretShow => 'Ipakita ang key';

  @override
  String get activitySlashNoMatch => 'Walang tumutugmang command. Ipadala bilang mensahe';

  @override
  String get activitySlashCommands => 'Mga command';

  @override
  String get activitySlashEnterArgs => 'Maglagay ng mga argumento, saka ipadala';

  @override
  String get activityStepTitle => 'Mga detalye ng hakbang';

  @override
  String get activityStepMissing => 'Wala ang hakbang na ito sa na-load na kasaysayan';

  @override
  String get activityStepQuestion => 'Tanong';

  @override
  String get activityStepSuccess => 'Matagumpay';

  @override
  String get activityStepNeedsPermission => 'Kailangan ng pahintulot';

  @override
  String get activityTools => 'Mga tool';

  @override
  String get activityStepDispatched => 'Naipadala';

  @override
  String get activityStepExecution => 'Pagpapatupad';

  @override
  String get activityStepLocation => 'Lokasyon';

  @override
  String get activityStepArguments => 'Mga argumento';

  @override
  String get activityStepChanges => 'Mga pagbabago';

  @override
  String get activityStepFullScreen => 'Tingnan nang full screen';

  @override
  String get activityStepReadContent => 'Nabasang nilalaman';

  @override
  String get activityStepWrittenContent => 'Naisulat na nilalaman';

  @override
  String get activityStepError => 'Error';

  @override
  String get activityOutput => 'Output';

  @override
  String get activityStepResult => 'Resulta';

  @override
  String get activityStepDeclined => 'Tinanggihan mo ang tool call na ito';

  @override
  String get activityStepNoOutput => 'Walang output';

  @override
  String get activityStepStart => 'Nagsimula';

  @override
  String get activityDuration => 'Tagal';

  @override
  String get activityFirstToken => 'Unang token';

  @override
  String get activityStepGeneration => 'Pagbuo';

  @override
  String get activityStepSpeed => 'Bilis';

  @override
  String get activityModel => 'Model';

  @override
  String get activityStepTiming => 'Oras';

  @override
  String get activityUsage => 'Paggamit';

  @override
  String get activityInput => 'Input';

  @override
  String get activityStepCacheHit => '  Cache hit';

  @override
  String get activityStepCacheMiss => '  Cache miss';

  @override
  String get activityStepCacheWrite => '  Cache write';

  @override
  String get activityStepReasoning => '  Pangangatwiran';

  @override
  String get activityStepAnswer => '  Sagot';

  @override
  String get activityStepThinking => 'Pag-iisip';

  @override
  String get activityStepExplanation => 'Paliwanag';

  @override
  String get activityStepToolCalls => 'Mga tool na tinawag sa hakbang na ito';

  @override
  String get activityStepProcessing => 'Pinoproseso ng model';

  @override
  String get activityApprovalAllowed => 'Pinayagan';

  @override
  String get activityApprovalUnanswered => 'Walang natanggap na pag-apruba';

  @override
  String get activityApprovalAnswered => 'Sinagot';

  @override
  String get activityToolRead => 'Basa';

  @override
  String get activityToolWrite => 'Sulat';

  @override
  String get activityToolCall => 'Tumawag ng tool';

  @override
  String get activityTraceTitle => 'Trajectory ng turn';

  @override
  String get activityTraceNotLoaded => 'Hindi pa na-load ang kasaysayan ng turn na ito';

  @override
  String get activityTraceOutputLimit => 'Naabot ang limitasyon ng output';

  @override
  String get activityTraceEngineRestarted => 'Naantala ng pag-restart ng engine';

  @override
  String get activityTraceBlocked => 'Naharang';

  @override
  String get activityTraceHeading => 'Trajectory ng turn';

  @override
  String get activityTraceWaiting => 'Naghihintay sa iyo';

  @override
  String get activityTraceNoSteps => 'Walang hakbang na may oras sa turn na ito';

  @override
  String get activityUsageInputIncludesCache => 'Kasama sa input ang mga cache hit';

  @override
  String get activityCacheHit => 'Cache hit';

  @override
  String get activitySummaryTodo => 'Na-update ang mga to-do';

  @override
  String get activityUsageBalance => 'Balanse ng DeepSeek';

  @override
  String get activityUsageContext => 'Context';

  @override
  String get activityUsageChat => 'Chat na ito';

  @override
  String get activityUsageAfterMessage => 'Lalabas pagkatapos mong magpadala ng mensahe';

  @override
  String get activityUsageWaiting => 'Naghihintay ng data sa paggamit ng context';

  @override
  String get activityUsageProjected => 'Tinatayang susunod na request';

  @override
  String get activityUsageLastRequest => 'Huling request';

  @override
  String get activityUsageBreakdownEstimate =>
      'Ang mga item sa breakdown ay magkakahiwalay na pagtataya at maaaring iba sa kabuuan';

  @override
  String get activityUsageCumulativeInput => 'Kabuuang input';

  @override
  String get activityUsageContextFull => 'Halos puno na ang context. Ipadala ang /compact para i-compact ito';

  @override
  String get activitySpanZero => '0 seg';

  @override
  String get activitySpanTiny => '<0.1 seg';

  @override
  String activityTokensTenThousands(String value) {
    return '${value}K';
  }

  @override
  String activityTokensHundredMillions(String value) {
    return '${value}M';
  }

  @override
  String activityUsageContextSemantics(String percent) {
    return '$percent na ng context ang nagamit, tingnan ang paggamit';
  }

  @override
  String activityUsageSystemTokens(String tokens) {
    return 'System $tokens';
  }

  @override
  String activityUsageToolTokens(String tokens) {
    return 'Mga tool $tokens';
  }

  @override
  String activityUsageMessageTokens(String tokens) {
    return 'Mga mensahe $tokens';
  }

  @override
  String activityUsageTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count turn sa kabuuan',
      one: '1 turn sa kabuuan',
    );
    return '$_temp0';
  }

  @override
  String activityUsageCacheWriteTokens(String tokens) {
    return 'Cache write $tokens';
  }

  @override
  String activitySummaryCommands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nagpatakbo ng $count command',
      one: 'Nagpatakbo ng 1 command',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryEditedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nag-edit ng $count file',
      one: 'Nag-edit ng 1 file',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryReadFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nagbasa ng $count file',
      one: 'Nagbasa ng 1 file',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySearches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Naghanap nang $count beses',
      one: 'Naghanap nang 1 beses',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryWeb(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gumamit ng web nang $count beses',
      one: 'Gumamit ng web nang 1 beses',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySubagents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tumawag ng subagent nang $count beses',
      one: 'Tumawag ng subagent nang 1 beses',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ibang tool: $count tawag',
      one: 'Ibang tool: 1 tawag',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gumamit ng $count tool',
      one: 'Gumamit ng 1 tool',
    );
    return '$_temp0';
  }

  @override
  String activityDiffBlockMarker(int index, int total) {
    return '@@ Pagbabago $index/$total @@';
  }

  @override
  String activityDiffEditMarker(int index, int total) {
    return 'Edit $index sa $total';
  }

  @override
  String activityTraceSpanSemantics(String title, String detail, String duration) {
    return '$title $detail, tagal $duration';
  }

  @override
  String activityTraceGroupSemantics(String label, String duration) {
    return '$label, tagal $duration';
  }

  @override
  String activityTraceEstimatedCost(String cost) {
    return '$cost (tinatayang ayon sa opisyal na rate)';
  }

  @override
  String activityTraceReasoningTokens(String tokens) {
    return 'Pangangatwiran: $tokens';
  }

  @override
  String activityStepPosition(int turn, Object step) {
    return 'Turn $turn · Hakbang $step';
  }

  @override
  String activityStepTokenSpeed(String speed) {
    return '$speed token/seg';
  }

  @override
  String activityStepRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count beses', one: '1 beses');
    return '$_temp0';
  }

  @override
  String activityStepTruncated(String text, int count) {
    return '$text\n… (Ipinapakita lang ang unang ${count}k karakter. Kopyahin para sa buong teksto)';
  }

  @override
  String activityStepLiveElapsed(String elapsed, String suffix) {
    return '$elapsed · Isinasagawa$suffix';
  }

  @override
  String activityStepCopySection(String title) {
    return 'Kopyahin ang $title';
  }

  @override
  String activityStepCopiedSection(String title) {
    return 'Nakopya ang $title';
  }

  @override
  String activitySlashDescriptionArgs(String description) {
    return '$description · Maglagay ng mga argumento, saka ipadala';
  }

  @override
  String activitySpanSecondsText(String seconds) {
    return '$seconds seg';
  }

  @override
  String activitySpanSeconds(int seconds) {
    return '$seconds seg';
  }

  @override
  String activitySpanMinutesSeconds(int minutes, String seconds) {
    return '$minutes min $seconds seg';
  }

  @override
  String activitySpanHoursMinutes(int hours, String minutes) {
    return '$hours oras $minutes min';
  }

  @override
  String activityCostUnderCent(String symbol) {
    return 'Wala pang ${symbol}0.01';
  }

  @override
  String activityCostApprox(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySpanRetries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sinubukang muli nang $count beses',
      one: 'Sinubukang muli nang 1 beses',
    );
    return '$_temp0';
  }

  @override
  String activitySpanToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pinili ang pagtawag ng $count tool',
      one: 'Pinili ang pagtawag ng 1 tool',
    );
    return '$_temp0';
  }

  @override
  String activityRunningItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'sa $count item', one: 'sa 1 item');
    return '$_temp0';
  }

  @override
  String activityRetryAttempt(int count) {
    return 'Pagtatangka $count';
  }

  @override
  String activityDiffFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count file', one: '1 file');
    return '$_temp0';
  }

  @override
  String activityDiffFileSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: '$added linya ang idinagdag',
      one: '1 linya ang idinagdag',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed linya ang inalis',
      one: '1 linya ang inalis',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String activityDiffEditNumber(int edit) {
    return 'Edit $edit';
  }

  @override
  String activityDiffHunkNumber(int index) {
    return 'Pagbabago $index';
  }

  @override
  String activityDiffFromLine(int line) {
    return 'Mula sa linya $line';
  }

  @override
  String activityDiffEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-edit nang $count beses',
      one: 'Na-edit nang 1 beses',
    );
    return '$_temp0';
  }

  @override
  String activityLunarZodiac(String animal) {
    return 'Good luck sa Taon ng $animal';
  }

  @override
  String activityReminderHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours oras nang tuloy-tuloy. Magpahinga?',
      one: 'Isang oras nang tuloy-tuloy. Magpahinga?',
    );
    return '$_temp0';
  }

  @override
  String get activityStepModelRequest => 'Isang request sa model';

  @override
  String activityStepModelRequestDetail(String detail) {
    return 'Isang request sa model · $detail';
  }

  @override
  String activityUsageEstimatedCost(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySlashCommandSemantics(String label, String name) {
    return '$label, /$name';
  }

  @override
  String get activityToolListSeparator => ',';

  @override
  String get androidShellTitle => 'Android Shell';

  @override
  String get androidShellEntryHint => 'Hiwalay na channel ng system command, naka-off bilang default';

  @override
  String get androidShellSubtitle =>
      'Magpatakbo ng mga Android system command sa telepono na ito sa pamamagitan ng Shizuku o self-ADB, hindi bash sa loob ng Ubuntu.';

  @override
  String get androidShellEnable => 'Payagan ang Android Shell';

  @override
  String get androidShellEnableHint =>
      'Hiwalay na switch, hindi nakadepende sa non-disruptive mode at mga setting ng kumpirmasyon sa screen.';

  @override
  String get androidShellConfirmationNote =>
      'Bawat command ay nangangailangan ng native na kumpirmasyon sa telepono. Hindi nalalapat ang mga exemption sa kumpirmasyon ng screen control. Naiiba ang mga pahintulot ng Shell sa screen control; hindi lahat ng command ay mahaharang ng mga patakaran ng app.';

  @override
  String get androidShellMasterOff =>
      'I-on ang Phone control sa nakaraang pahina bago i-enable ang Android Shell. Nananatiling available dito ang gabay sa authorization at pairing.';

  @override
  String get androidShellRiskTitle => 'Payagan ang mga Android system command?';

  @override
  String get androidShellRiskBody =>
      'Ginagamit ng mga command ang aktwal na UID ng napiling channel at maaaring magbago ng mga app, system settings at shared file. Hindi sila lubos na mapoprotektahan ng mga patakaran ng app sa screen. Bawat command ay nangangailangan pa rin ng hiwalay na native na kumpirmasyon. Payagan lang ang mga command na naiintindihan at pinagkakatiwalaan mo.';

  @override
  String get androidShellRiskAction => 'Payagan ang Android Shell';

  @override
  String get androidShellBackend => 'Execution channel';

  @override
  String get androidShellShizukuHint =>
      'Gumamit ng naka-install at tumatakbong Shizuku na may tahasang awtorisasyon. Hindi kailangan ang Android 14, accessibility at non-disruptive mode.';

  @override
  String get androidShellAdb => 'Self-ADB';

  @override
  String get androidShellAdbHint =>
      'Kumonekta sa wireless debugging ng telepono na ito gamit ang pribadong ADB identity ng app. Walang ibang device na kokontakin.';

  @override
  String get androidShellInstalled => 'Naka-install ang Shizuku';

  @override
  String get androidShellRunning => 'Tumatakbo ang Shizuku';

  @override
  String get androidShellGranted => 'Awtorisado ang Shizuku';

  @override
  String get androidShellPaired => 'Naka-pair ang ADB';

  @override
  String get androidShellConnected => 'Nakakonekta ang ADB';

  @override
  String get androidShellAuthorize => 'Humiling ng awtorisasyon ng Shizuku';

  @override
  String get androidShellAuthorizeHint =>
      'I-install at simulan ang Shizuku, saka pindutin ang button na ito para i-authorize ang dsh-Go. Hindi kailanman humihingi ng pahintulot ang pagbubukas o pag-refresh ng pahinang ito.';

  @override
  String get androidShellStatus => 'Katayuan ng execution';

  @override
  String get androidShellUid => 'Aktwal na UID';

  @override
  String get androidShellUidUnknown => 'Hindi pa naiuulat';

  @override
  String get androidShellRefresh => 'I-refresh ang katayuan';

  @override
  String get androidShellStop => 'Ihinto ang Android Shell';

  @override
  String get androidShellStopHint =>
      'Kanselahin ang kasalukuyang mga command at ihinto ang hiwalay na execution ng Shell nang hindi pinapatay ang screen control.';

  @override
  String get androidShellPairingGuide =>
      'Sa Developer options, i-enable ang Wireless debugging at piliin ang Pair device with pairing code. Ginagamit lang ang code para sa pairing na ito at hindi sine-save o nilolog.';

  @override
  String get androidShellStartPairing => 'Buksan ang gabay sa pairing';

  @override
  String get androidShellPair => 'Ilagay ang pairing code';

  @override
  String get androidShellPairSubmit => 'I-pair';

  @override
  String get androidShellPairCode => 'Anim na digit na pairing code';

  @override
  String get androidShellPairPort => 'Pairing port (opsyonal)';

  @override
  String get androidShellPairPortHint =>
      'Gamitin ang port sa pairing dialog, hindi ang connection port sa pangunahing pahina ng Wireless debugging. Iwanang blangko para sa discovery.';

  @override
  String get androidShellConnect => 'Ikonekta ang ADB';

  @override
  String get androidShellConnectChannel => 'Ikonekta ang napiling channel';

  @override
  String get androidShellConnectPort => 'Connection port (opsyonal)';

  @override
  String get androidShellConnectPortHint =>
      'Gamitin ang port sa ilalim ng IP address & port sa pangunahing pahina ng Wireless debugging, hindi ang pairing port. Ang telepono lang na ito ang kokontakin. Iwanang blangko para sa discovery.';

  @override
  String androidShellErrorCode(String code) {
    return 'Error code: $code';
  }

  @override
  String androidShellLimits(int seconds, int bytes) {
    return 'Hanggang $seconds segundo at $bytes byte ng output bawat command';
  }

  @override
  String get androidShellErrorDisabled => 'Naka-off ang Android Shell.';

  @override
  String get androidShellErrorNotConnected => 'Hindi nakakonekta ang napiling channel.';

  @override
  String get androidShellErrorShizukuMissing => 'I-install muna ang Shizuku.';

  @override
  String get androidShellErrorShizukuStopped => 'Simulan ang Shizuku, saka i-refresh ang katayuan.';

  @override
  String get androidShellErrorPermissionRequired => 'Kailangan ng tahasang awtorisasyon sa Shizuku.';

  @override
  String get androidShellErrorAdbNotPaired =>
      'I-pair ang telepono na ito gamit ang wireless debugging, saka ikonekta ang ADB.';

  @override
  String get androidShellErrorConnectFailed =>
      'Nabigo ang koneksyon. Suriin ang napiling channel at kasalukuyang connection port ng wireless debugging, saka subukang muli.';

  @override
  String get androidShellErrorIdentityChanged =>
      'Nagbago ang pagkakakilanlan ng channel. Ihinto, saka mag-authorize o kumonekta muli.';

  @override
  String get androidShellErrorBusy =>
      'May isa pang operasyong nakabinbin. Subukang muli mamaya o ihinto muna ang Android Shell.';

  @override
  String get androidShellErrorInvalidArguments =>
      'Di-wastong input. Gumamit ng anim na digit na pairing code at port mula 1 hanggang 65535.';

  @override
  String get androidShellErrorCancelled => 'Kinansela ang operasyon.';

  @override
  String get androidShellErrorTimeout =>
      'Nag-time out ang operasyon. I-verify muna ang resulta; huwag kailanman awtomatikong subukang muli ang naipadalang command.';

  @override
  String get androidShellErrorConfirmationDenied => 'Hindi inaprubahan ang command.';

  @override
  String get androidShellErrorCleanupFailed =>
      'Hindi natapos ang paglilinis sa pagtigil. Subukang ihinto muli bago magpatakbo ng mga bagong command.';

  @override
  String get androidShellErrorLocked => 'Naka-lock ang telepono. I-unlock ito at subukang muli.';

  @override
  String get androidShellErrorConfirmationUnavailable =>
      'Hindi maipakita ang native na kumpirmasyon. Bumalik sa app at suriin ang pahintulot sa notification.';

  @override
  String get androidShellErrorTransportLost =>
      'Nadiskonekta ang channel. I-verify muna ang resulta; huwag kailanman awtomatikong subukang muli ang naipadalang command. Kumonekta muli kung kinakailangan.';

  @override
  String get androidShellErrorProtocolMismatch =>
      'Hindi sinusuportahan ng native module ang protocol na ito ng Shell. I-update ang app.';

  @override
  String get androidShellErrorNativeUnavailable =>
      'Hindi available sa build na ito ang native module ng Android Shell.';

  @override
  String get androidShellErrorInvalidResponse =>
      'Walang natanggap na wastong native na status. I-refresh o i-update ang app.';

  @override
  String get androidShellErrorStopFailed =>
      'Hindi nakumpirma ang pagtigil. I-refresh ang katayuan at subukang ihinto muli.';

  @override
  String get androidShellErrorUnknown =>
      'Hindi makumpirma ang resulta. I-verify muna ito; huwag kailanman awtomatikong subukang muli ang naipadalang command.';

  @override
  String get botsFolderGone => 'Wala na ang folder na ito';

  @override
  String get botsFolderReadFailed => 'Hindi mabasa ang folder na ito';

  @override
  String get botsFolderOpenFailed => 'Hindi mabuksan ang folder na ito';

  @override
  String botsFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count folder', one: '1 folder');
    return '$_temp0';
  }

  @override
  String get botsWorkingFolder => 'Working directory';

  @override
  String get botsFolderTeamDefault => 'Workspace ng team';

  @override
  String get botsFolderRoomDefault => 'Sariling directory ng bawat Bot';

  @override
  String get botsFolderHint => 'Mga folder sa nakakonektang host.';

  @override
  String get botsFolderCurrent => 'Kasalukuyang directory';

  @override
  String get botsFolderUnavailable => 'Nagbago ang koneksyon o folder. Buksan muli para magpatuloy.';

  @override
  String get botsFolderNoChoices => 'Walang ibang folder sa host.';

  @override
  String get botsFolderConfirm => 'Gamitin ang working directory na ito?';

  @override
  String get botsFolderRefused =>
      'Tinanggihan ng host ang folder na ito. Maaaring wala na ito, hindi ma-access o protektado. Pumili ng iba o subukang muli.';

  @override
  String botsChildCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count child agent', one: '1 child agent');
    return '$_temp0';
  }

  @override
  String get botsCurrentChat => 'Kasalukuyang chat';

  @override
  String botsSubagentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagent', one: '1 subagent');
    return '$_temp0';
  }

  @override
  String botsRunningCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ang tumatakbo',
      one: '1 ang tumatakbo',
    );
    return '$_temp0';
  }

  @override
  String botsFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count ang nabigo', one: '1 ang nabigo');
    return '$_temp0';
  }

  @override
  String botsNestedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kasama ang $count child agent',
      one: 'Kasama ang 1 child agent',
    );
    return '$_temp0';
  }

  @override
  String botsBackToParent(String title) {
    return 'Bumalik sa “$title”';
  }

  @override
  String botsTeamMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Agent team, $count miyembro',
      one: 'Agent team, 1 miyembro',
    );
    return '$_temp0';
  }

  @override
  String get botsAgentTeam => 'Agent team';

  @override
  String botsSubagentRunningCount(int count, int running) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagent', one: '1 subagent');
    String _temp1 = intl.Intl.pluralLogic(
      running,
      locale: localeName,
      other: '$running ang tumatakbo',
      one: '1 ang tumatakbo',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get botsSubagents => 'Mga subagent';

  @override
  String get botsNoSubagents => 'Walang naipadalang subagent';

  @override
  String get botsOpenChatFirst => 'Magbukas muna ng chat';

  @override
  String get botsTeamReadFailed => 'Hindi ma-load ang team';

  @override
  String get botsNoTeamOnHost => 'Walang agent team sa host na ito';

  @override
  String get botsTeamNotEnabled => 'Naka-off ang agent team';

  @override
  String get botsTeamDescription => 'Nagtutulungan ang mga agent sa isang shared task board';

  @override
  String get botsTeamEnabling => 'Ino-on…';

  @override
  String get botsTeamEnable => 'I-on ang team';

  @override
  String botsMembersWorking(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count miyembro ang gumagana',
      one: '1 miyembro ang gumagana',
    );
    return '$_temp0';
  }

  @override
  String get botsTeamStandby => 'Lahat ay naka-standby';

  @override
  String get botsMembers => 'Mga miyembro';

  @override
  String get botsTasks => 'Mga gawain';

  @override
  String get botsTeamRecordUnreadable => 'Hindi mabasa ang isang talaan ng team';

  @override
  String get botsMessages => 'Mga mensahe';

  @override
  String get botsOwner => 'May-ari';

  @override
  String get botsTeamCreateHint => 'Hilingin sa AI na bumuo ng team sa isang chat';

  @override
  String get botsCurrent => 'Kasalukuyan';

  @override
  String get botsNoTasks => 'Wala pang gawain';

  @override
  String get botsTodo => 'Gagawin';

  @override
  String get botsUnassigned => 'Hindi nakatalaga';

  @override
  String botsTaskWaitingFor(String dependencies) {
    return 'Naghihintay sa $dependencies';
  }

  @override
  String get botsWriteOverlap => 'Nagsasapawang write scope';

  @override
  String get botsWaitingDependencies => 'Naghihintay sa mga dependency';

  @override
  String get botsReadyToStart => 'Handa nang magsimula';

  @override
  String get botsTaskId => 'ID';

  @override
  String get botsDependencies => 'Mga dependency';

  @override
  String get botsWriteScopes => 'Mga write scope';

  @override
  String get botsMessagesReadFailed => 'Hindi ma-load ang mga mensahe';

  @override
  String get botsNoMemberMessages => 'Wala pang mensahe sa pagitan ng mga miyembro';

  @override
  String get botsMessagesIncomplete => 'Hindi na-load ang mga mensahe ng ilang miyembro · Subukang muli';

  @override
  String botsDateTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get botsViewDetails => 'Tingnan ang mga detalye';

  @override
  String get botsAdmin => 'Admin';

  @override
  String get botsFullTextChanged => 'Nagbago ang usapang ito';

  @override
  String get botsFullTextReopen => 'Buksan muli ang mensahe';

  @override
  String get botsFullTextReadFailed => 'Hindi ma-load ang buong teksto';

  @override
  String get botsShowAll => 'Ipakita lahat';

  @override
  String get botsImagePlaceholder => '[Larawan]';

  @override
  String get botsSending => 'Ipinapadala';

  @override
  String get botsWriteOwn => 'Sumulat ng sarili';

  @override
  String get botsSubmit => 'Isumite';

  @override
  String botsChooseModelFor(String name) {
    return 'Pumili ng model para kay $name';
  }

  @override
  String get botsModelGreeting => 'Magha-hello ito kapag pumili ka';

  @override
  String get botsChooseModel => 'Pumili ng model';

  @override
  String get botsSkipAnswer => 'Laktawan';

  @override
  String get botsBotGone => 'Wala na ang bot na ito';

  @override
  String get botsWaitingModel => 'Pumili ng model';

  @override
  String get botsThinking => 'Nag-iisip';

  @override
  String get botsMainBot => 'Pangunahing bot';

  @override
  String get botsIdle => 'Idle';

  @override
  String get botsAnsweredQuestion => 'Sinagot mo ang tanong nito';

  @override
  String get botsEarlierMessages => 'Mga naunang mensahe';

  @override
  String botsComposerHint(String name) {
    return 'Mensahe kay $name…';
  }

  @override
  String botsDeleteNamed(String name) {
    return 'Burahin ang “$name”?';
  }

  @override
  String get botsDeleteBotBody => 'Mananatili ang mga chat nito. Ililipat sa archive ang mga alaala nito.';

  @override
  String get botsTokensToday => '24h na token';

  @override
  String get botsMemoryUnit => 'Mga alaala';

  @override
  String get botsRoomUnit => 'Mga group chat';

  @override
  String get botsProfile => 'Profile';

  @override
  String get botsModel => 'Model';

  @override
  String get botsBotName => 'Pangalan';

  @override
  String get botsRole => 'Tungkulin';

  @override
  String get botsWriterExample => 'Halimbawa: Manunulat';

  @override
  String get botsInstructions => 'Mga tagubilin';

  @override
  String get botsInstructionsHint => 'Paano ito dapat gumana';

  @override
  String get botsColor => 'Kulay';

  @override
  String get botsUsage => 'Paggamit';

  @override
  String get botsUsageScanning => 'Binibilang pa ang mga naunang chat. Mapupunan ang mga kabuuan.';

  @override
  String get botsUsageRefresh => 'I-refresh';

  @override
  String get botsToday => 'Nakaraang 24 oras';

  @override
  String get botsLastWeek => 'Nakaraang 7 araw';

  @override
  String get botsLastMonth => 'Nakaraang 30 araw';

  @override
  String botsMonthCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nakaraang 30 araw · $count tawag',
      one: 'Nakaraang 30 araw · 1 tawag',
    );
    return '$_temp0';
  }

  @override
  String get botsFullRecord => 'Buong talaan';

  @override
  String get botsEveryToolCall => 'Bawat tool call';

  @override
  String get botsUnsetMain => 'Alisin ang pagiging pangunahing bot';

  @override
  String get botsSetMain => 'Itakda bilang pangunahin';

  @override
  String get botsDeleteBot => 'Burahin ang bot';

  @override
  String get botsEffortOff => 'Walang pag-iisip';

  @override
  String get botsEffortMinimal => 'Minimal';

  @override
  String get botsEffortLow => 'Mababa';

  @override
  String get botsEffortMedium => 'Katamtaman';

  @override
  String get botsEffortHigh => 'Mataas';

  @override
  String get botsEffortMax => 'Max';

  @override
  String botsNamedRecord(String name) {
    return '$name · Buong talaan';
  }

  @override
  String get botsOrganizingNotes => 'Inaayos ang mga tala';

  @override
  String get botsToolRun => 'magpatakbo ng mga command';

  @override
  String get botsToolRead => 'tumingin ng mga file';

  @override
  String get botsToolEdit => 'mag-edit ng mga file';

  @override
  String get botsToolSearch => 'maghanap sa web';

  @override
  String get botsToolBrowse => 'mag-browse sa web';

  @override
  String get botsToolMessage => 'makipag-ugnayan sa ibang bot';

  @override
  String get botsToolGroup => 'makipag-chat sa grupo';

  @override
  String get botsToolMemory => 'ayusin ang mga alaala';

  @override
  String get botsToolRecall => 'suriin ang mga talaan';

  @override
  String get botsToolTeam => 'ayusin ang team';

  @override
  String get botsToolAsk => 'magtanong sa iyo';

  @override
  String get botsToolWork => 'magtrabaho';

  @override
  String get botsJustNow => 'Ngayon lang';

  @override
  String botsCountHundredMillion(String value) {
    return '${value}M';
  }

  @override
  String botsCountTenThousand(String value) {
    return '${value}K';
  }

  @override
  String get botsModelNotSelected => 'Hindi napili';

  @override
  String botsYourPreview(String preview) {
    return 'Ikaw: $preview';
  }

  @override
  String botsEventWorking(String name) {
    return 'Nagsimulang magtrabaho si $name';
  }

  @override
  String botsEventApproval(String name) {
    return 'Kailangan ni $name ang iyong pag-apruba';
  }

  @override
  String botsEventDone(String name) {
    return 'Natapos magtrabaho si $name';
  }

  @override
  String botsEventStopped(String name) {
    return 'Itinigil mo ang trabaho ni $name';
  }

  @override
  String botsEventFailed(String name) {
    return 'Hindi nakasagot si $name';
  }

  @override
  String botsEventMissed(String name) {
    return 'Hindi tumugon si $name sa tamang oras';
  }

  @override
  String botsEventLookup(String name) {
    return 'Sinuri ni $name ang mga chat nito';
  }

  @override
  String botsEventLookupQuery(String name, String query) {
    return 'Hinanap ni $name sa mga chat nito ang “$query”';
  }

  @override
  String botsEventResumed(String name) {
    return 'Nagpatuloy si $name pagkatapos mag-restart';
  }

  @override
  String botsEventCut(String name) {
    return 'Huminto si $name matapos itong maantala ng isa pang restart';
  }

  @override
  String get botsAutomation => 'Automation';

  @override
  String botsAutomationText(String text) {
    return 'Automation: $text';
  }

  @override
  String get botsOtherBot => 'Ibang bot';

  @override
  String botsMessageFrom(String name) {
    return 'Mensahe mula kay $name';
  }

  @override
  String botsEventReplied(String name) {
    return 'Sumagot si $name';
  }

  @override
  String get botsGroupReplied => 'Isang sagot sa grupo';

  @override
  String botsNamedGroupReplied(String name) {
    return 'Isang sagot sa “$name”';
  }

  @override
  String botsEventCalledStop(String name) {
    return 'Itinigil ni $name ang trabaho';
  }

  @override
  String get botsChooseMember => 'Pumili ng miyembro';

  @override
  String get botsMentionMember => 'I-mention ang miyembro';

  @override
  String get botsRelayUnavailable => 'Hindi available ang mga bot sa Relay';

  @override
  String get botsUseSsh => 'Kumonekta sa computer na ito sa pamamagitan ng SSH para magamit ang mga bot';

  @override
  String get botsTeamLoadFailed => 'Hindi ma-load ang bot team';

  @override
  String botsBotCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bot', one: '1 bot');
    return '$_temp0';
  }

  @override
  String botsRoomCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count group chat', one: '1 group chat');
    return '$_temp0';
  }

  @override
  String get botsNewBot => 'Bagong bot';

  @override
  String get botsGroupChat => 'Group chat';

  @override
  String get botsNewGroup => 'Bagong grupo';

  @override
  String get botsDuplicateCreated => 'Nakopya. Lalabas ito sa listahan sa ilang sandali.';

  @override
  String get botsDuplicate => 'I-duplicate ang Bot';

  @override
  String get botsDuplicateHint => 'Parehong mga setting, bagong chat at alaala';

  @override
  String botsDuplicateNamed(String name) {
    return 'I-duplicate ang $name?';
  }

  @override
  String get botsDuplicateBody =>
      'Pananatilihin ng bagong Bot ang trabaho, mga tagubilin at setting ng model, magsisimula sa bagong chat at personal na alaala, at kukunin ang pangalan nito mula sa host. Kapag may available na model, magbubukas ito ng pagbati.';

  @override
  String get botsChooseModelStart => 'Pumili ng model para magsimula';

  @override
  String get botsNoChats => 'Wala pang chat';

  @override
  String botsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hindi pa nababasa',
      one: '1 hindi pa nababasa',
    );
    return '$_temp0';
  }

  @override
  String get botsMainTag => 'Pangunahin';

  @override
  String get botsMemberNeedsApproval => 'May miyembrong nangangailangan ng pag-apruba';

  @override
  String botsNamedWorking(String name) {
    return 'Gumagana si $name';
  }

  @override
  String botsNamesWorking(String names) {
    return 'Gumagana sina $names';
  }

  @override
  String botsMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count miyembro', one: '1 miyembro');
    return '$_temp0';
  }

  @override
  String get botsUpdateRequired => 'Kailangang i-update ang DS Bot';

  @override
  String get botsInstall => 'I-install ang DS Bot';

  @override
  String get botsUpdateForPhone => 'I-update para magamit ito sa telepono mo';

  @override
  String get botsInstallDescription => 'Mga bot na laging naka-on, bawat isa ay may sariling alaala at tungkulin';

  @override
  String botsInstallOnHost(String host) {
    return 'I-install sa $host para magsimula';
  }

  @override
  String botsRunsOnHost(String host) {
    return 'Tumatakbo sa $host';
  }

  @override
  String get botsInstalling => 'Ini-install';

  @override
  String get botsMemory => 'Alaala';

  @override
  String get botsEditMemory => 'I-edit ang alaala';

  @override
  String get botsAddMemory => 'Magdagdag ng alaala';

  @override
  String get botsMemoryReplyExample => 'Halimbawa: Panatilihing maikli ang mga sagot';

  @override
  String get botsMemoryDraftExample => 'Halimbawa: Unang draft bago mag-Biyernes';

  @override
  String botsMemoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Alaala · $count', one: 'Alaala · 1');
    return '$_temp0';
  }

  @override
  String get botsMemoryReadFailed => 'Hindi ma-load ang mga alaala';

  @override
  String get botsSummary => 'Buod';

  @override
  String get botsNoMemory => 'Wala pang alaala';

  @override
  String get botsTeam => 'Team';

  @override
  String get botsSelf => 'Sarili';

  @override
  String get botsWrittenByYou => 'Isinulat mo';

  @override
  String get botsNameRequired => 'Maglagay ng pangalan';

  @override
  String get botsRoleHint => 'Ano ang ginagawa nito, sa isang pangungusap';

  @override
  String get botsNewInstructionsHint => 'Paano ito dapat gumana at ano ang dapat tandaan';

  @override
  String get botsAppearance => 'Hitsura';

  @override
  String get botsCreating => 'Nililikha';

  @override
  String get botsGroupNameOptional => 'Pangalan ng grupo (opsyonal)';

  @override
  String botsMembersSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mga miyembro · $count ang napili',
      one: 'Mga miyembro · 1 ang napili',
    );
    return '$_temp0';
  }

  @override
  String get botsPickTwoBots => 'Pumili ng kahit dalawang bot';

  @override
  String get botsFullText => 'Buong teksto';

  @override
  String botsTextPartial(String count) {
    return 'Ipinapakita ang unang $count karakter';
  }

  @override
  String get botsTextCompletenessUnknown => 'Hindi makumpirmang kumpleto ang tekstong ito';

  @override
  String get botsRoomGone => 'Wala na ang group chat na ito';

  @override
  String botsNamedSpeaking(String name) {
    return 'Nagsasalita si $name';
  }

  @override
  String botsNamedActivity(String name, String activity) {
    return '$name: $activity';
  }

  @override
  String get botsWorking => 'Gumagana';

  @override
  String get botsDiscussing => 'Nag-uusap';

  @override
  String get botsTyping => 'Nagta-type';

  @override
  String get botsGroupComposerHint => 'Mensahe sa lahat…';

  @override
  String get botsDecline => 'Tanggihan';

  @override
  String get botsAllowOnce => 'Payagan nang isang beses';

  @override
  String get botsPrivateChat => 'Makipag-chat nang pribado';

  @override
  String get botsSetAdmin => 'Gawing admin';

  @override
  String get botsRemoveMember => 'Alisin sa grupo';

  @override
  String get botsDeleteRoomBody => 'Mananatili ang mga talaan ng grupo. Ililipat sa archive ang mga alaala nito.';

  @override
  String botsNamedAdmin(String name) {
    return 'Admin $name';
  }

  @override
  String botsRoomWorkingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ang gumagana',
      one: '1 ang gumagana',
    );
    return '$_temp0';
  }

  @override
  String botsMembersCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mga miyembro · $count',
      one: 'Mga miyembro · 1',
    );
    return '$_temp0';
  }

  @override
  String get botsStopMember => 'Ihinto';

  @override
  String get botsAddMember => 'Magdagdag ng mga miyembro';

  @override
  String get botsWhoAnswers => 'Sino ang unang sasagot';

  @override
  String get botsAdminFirst => 'Admin muna';

  @override
  String get botsEveryoneInTurn => 'Salitan';

  @override
  String get botsGroupName => 'Pangalan ng grupo';

  @override
  String get botsGroupNotice => 'Paunawa ng grupo';

  @override
  String get botsGroupNoticeHint => 'Nakikita ito ng bawat miyembro bago magsalita';

  @override
  String get botsDeleteGroup => 'Burahin ang grupo';

  @override
  String get botsDiscardTitle => 'Itapon ang mga pagbabago?';

  @override
  String get botsKeepEditing => 'Magpatuloy sa pag-edit';

  @override
  String get botsDiscard => 'Itapon';

  @override
  String get botsProgress => 'Progreso';

  @override
  String get botsGlyphRun => 'Takbo';

  @override
  String get botsGlyphJobOutput => 'Ilista ang mga background job';

  @override
  String get botsGlyphJobs => 'Mga background job';

  @override
  String get botsGlyphStopJob => 'Ihinto ang background job';

  @override
  String get botsGlyphRead => 'Basa';

  @override
  String get botsGlyphImage => 'Tingnan ang larawan';

  @override
  String get botsGlyphDeliver => 'Ipakita ang mga file';

  @override
  String get botsGlyphWrite => 'Sulat';

  @override
  String get botsGlyphSearch => 'Maghanap';

  @override
  String get botsGlyphFindFiles => 'Maghanap ng mga file';

  @override
  String get botsGlyphOpenWeb => 'Buksan ang webpage';

  @override
  String get botsGlyphMessageAgent => 'Mag-message sa subagent';

  @override
  String get botsGlyphInterruptAgent => 'Putulin ang subagent';

  @override
  String get botsGlyphListModels => 'Ilista ang mga model ng subagent';

  @override
  String get botsGlyphWorkflow => 'Workflow';

  @override
  String get botsGlyphLoop => 'Loop task';

  @override
  String get botsGlyphSkill => 'Gumamit ng skill';

  @override
  String get botsGlyphTodo => 'I-update ang mga to-do';

  @override
  String get botsGlyphSetGoal => 'Itakda ang layunin';

  @override
  String get botsGlyphViewGoal => 'Tingnan ang layunin';

  @override
  String get botsGlyphUpdateGoal => 'I-update ang layunin';

  @override
  String get botsGlyphAsk => 'Magtanong';

  @override
  String get botsCommunityEmpty => 'Wala pang narito';

  @override
  String get botsCommunityGroups => 'Mga chat group';

  @override
  String get botsCommunity => 'Komunidad';

  @override
  String get botsForum => 'Forum';

  @override
  String get botsForumSubtitle => 'Magtanong, magbahagi, kumonekta';

  @override
  String get botsProjectHome => 'Home ng proyektong JDK-Go';

  @override
  String get botsOpenSource => 'Open-source na proyekto';

  @override
  String get botsPluginCatalogFailed => 'Hindi mabuksan ang katalogo ng plugin';

  @override
  String get botsTapRetry => 'I-tap para subukang muli';

  @override
  String get botsFeaturedPlugins => 'Mga itinatampok na plugin';

  @override
  String get botsPluginSource => 'Impormasyon ng plugin mula sa dshfind';

  @override
  String get botsPromptIdeas => 'Subukan ito';

  @override
  String get botsUpdates => 'Ano ang bago';

  @override
  String get botsLink => 'link';

  @override
  String botsLinkOpenFailed(String host) {
    return 'Hindi mabuksan ang $host';
  }

  @override
  String botsYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String get botsCopyGroupNumber => 'Kopyahin ang numero ng grupo';

  @override
  String botsQrCodeLabel(String title) {
    return 'QR code ng $title';
  }

  @override
  String get botsFiles => 'Mga file';

  @override
  String get botsEmptyCell => '(walang laman)';

  @override
  String botsYesterdayTime(String time) {
    return 'Kahapon $time';
  }

  @override
  String get botsOutsideWorkspace => 'Sa labas ng workspace';

  @override
  String get botsNotFolder => 'Hindi ito folder';

  @override
  String get botsChatNotFound => 'Hindi nahanap ang chat';

  @override
  String get botsBrowseUnsupported => 'Hindi sinusuportahan ng koneksyong ito ang pag-browse ng file';

  @override
  String get botsWorkspace => 'Workspace';

  @override
  String get botsSearchFiles => 'Maghanap ng mga file';

  @override
  String get botsGoUp => 'Umakyat';

  @override
  String get botsEmptyFolder => 'Walang laman na folder';

  @override
  String botsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count file', one: '1 file');
    return '$_temp0';
  }

  @override
  String botsTruncatedItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ang unang $count item lang ang ipinapakita',
      one: 'Ang unang item lang ang ipinapakita',
    );
    return '$_temp0';
  }

  @override
  String get botsMoreActions => 'Higit pang mga aksyon';

  @override
  String get botsSearchFailed => 'Hindi makapaghanap';

  @override
  String get botsNoResults => 'Walang resulta';

  @override
  String get botsCopyPath => 'Kopyahin ang path';

  @override
  String get botsPetOutsideApp => 'Ipakita sa labas ng app';

  @override
  String get botsPetNotAuthorized => 'Hindi pinapayagan';

  @override
  String get botsPetDisplayWhen => 'Kailan ipapakita';

  @override
  String get botsPetWhenActive => 'Kapag aktibo';

  @override
  String get botsPetAlways => 'Palagi';

  @override
  String get botsPetSwitchDisabled => 'Naka-disable ang switch';

  @override
  String get botsPetRestrictedSettings => 'Payagan ang restricted settings';

  @override
  String get botsPetHiddenToday => 'Nakatago hanggang ngayong araw';

  @override
  String get botsPetRestore => 'Ibalik';

  @override
  String get botsPetChange => 'Palitan ang pet';

  @override
  String get botsPetHideHour => 'Itago nang 1 oras';

  @override
  String get botsPetSettings => 'Mga setting ng pet';

  @override
  String get botsPetDeepy => 'Deepy';

  @override
  String get botsPetWhaleGirl => 'Whale girl';

  @override
  String get botsPetNone => 'Wala';

  @override
  String get botsPets => 'Mga pet';

  @override
  String get botsPetSource => 'Mula sa DSH-TUI';

  @override
  String get botsPetImport => 'I-import';

  @override
  String get botsPetImportHint =>
      'Dalhin ang sarili mong pixel pet: isang zip na may pack.json at mga PNG frame sheet; nasa docs/design/pets.md sa repository ang format. Pindutin nang matagal ang na-import na pet para burahin ito.';

  @override
  String botsPetImportDone(String name) {
    return 'Narito si $name';
  }

  @override
  String botsPetCodexTitle(String name) {
    return 'Na-convert si $name mula sa isang Codex pet';
  }

  @override
  String get botsPetCodexBody => 'Karamihan ay dumadaan nang walang pagbabago. May ilang pagkakaiba:';

  @override
  String get botsPetCodexOk => 'Naintindihan ko';

  @override
  String get botsPetCodexLoops =>
      'Umuulit ang mga galaw hanggang magbago ang estado, sa halip na bumalik sa idle pagkatapos ng ilang round tulad sa Codex';

  @override
  String get botsPetCodexRoamLeft => 'Ang paglakad pakaliwa ay salamin ng hilera ng paglakad pakanan';

  @override
  String get botsPetCodexDrag => 'Laging gumagamit ng hilera ng nakaharap sa kanan ang pag-drag';

  @override
  String get botsPetCodexSleep => 'Ipinapakita ng pagtulog ang unang idle frame';

  @override
  String get botsPetCodexLook => 'Hindi ginagamit ang mga cell ng pagtingin sa bawat direksyon';

  @override
  String get botsPetCodexWebp => 'Na-convert sa PNG ang WebP sheet';

  @override
  String get botsPetCodexCustomTracks => 'Hindi nakakabit sa anumang estado ang mga custom na hilera ng galaw';

  @override
  String get botsPetCodexFps => 'Ni-round sa buong millisecond ang mga frame rate';

  @override
  String get botsPetCodexOneShot => 'Ang JDK ang nagpapasya kung saan bumabalik ang play-once na galaw';

  @override
  String get botsPetCodexMissingAuthor => 'Walang pinangalanang may-akda ang pack';

  @override
  String get botsPetCodexMissingLicense => 'Walang pinangalanang lisensya ang pack';

  @override
  String get botsPetCodexMissingSource => 'Walang pinangalanang source ang pack';

  @override
  String botsPetImportReplaced(String name) {
    return 'Na-update si $name';
  }

  @override
  String get botsPetImportNotZip => 'Hindi iyan zip file';

  @override
  String get botsPetImportNoPack => 'Walang pack.json sa zip';

  @override
  String botsPetImportBadPack(String detail) {
    return 'May problema ang pack.json: $detail';
  }

  @override
  String botsPetImportMissingSheet(String name) {
    return 'Nawawala sa zip ang sheet na $name';
  }

  @override
  String botsPetImportBadSheet(String name) {
    return 'May mali sa isang sheet: $name (kumpletong PNG, hanggang 4096 pixel bawat gilid, nasa loob ang bawat frame)';
  }

  @override
  String get botsPetImportTooLarge => 'Masyadong malaki ang pet pack na ito';

  @override
  String get botsPetImportStorage => 'Hindi ito ma-save sa telepono. Subukang muli';

  @override
  String botsPetRemoveTitle(String name) {
    return 'Burahin si $name?';
  }

  @override
  String get botsPetRemoveBody => 'Maaari mo itong i-import muli mamaya.';

  @override
  String botsPetRemoveFailed(String name) {
    return 'Hindi mabura si $name. Subukang muli';
  }

  @override
  String get botsPetSize => 'Laki';

  @override
  String get botsPetQuiet => 'Quiet mode';

  @override
  String get botsPetQuietSubtitle => 'Mga animation lang, walang bubble';

  @override
  String get botsPetShowNow => 'Ipakita ngayon';

  @override
  String botsPetHiddenUntil(String time) {
    return 'Nakatago hanggang $time';
  }

  @override
  String get botsKeyEsc => 'Magpadala ng Esc';

  @override
  String get botsKeyTab => 'Magpadala ng Tab';

  @override
  String get botsKeyLeft => 'Kaliwa';

  @override
  String get botsKeyUp => 'Pataas';

  @override
  String get botsKeyDown => 'Pababa';

  @override
  String get botsKeyRight => 'Kanan';

  @override
  String get botsKeyPipe => 'Pipe';

  @override
  String get botsKeyTilde => 'Tilde';

  @override
  String get botsKeySlash => 'Slash';

  @override
  String get botsKeyDash => 'Hyphen';

  @override
  String get botsTerminal => 'Terminal';

  @override
  String get botsTerminalRename => 'Palitan ang pangalan ng terminal';

  @override
  String get botsTerminalName => 'Pangalan ng terminal';

  @override
  String get botsTerminalRenameFailed => 'Hindi mapalitan ang pangalan';

  @override
  String botsTerminalCloseNamed(String title) {
    return 'Isara ang “$title”?';
  }

  @override
  String get botsTerminalCloseBody => 'Magwawakas ang mga proseso sa loob';

  @override
  String get botsTerminalUnsupported => 'Hindi available ang terminal sa koneksyong ito';

  @override
  String get botsTerminalSupportedHosts => 'Available sa telepono na ito, isang SSH host o isang Remote na computer';

  @override
  String get botsTerminalOpening => 'Binubuksan ang terminal…';

  @override
  String get botsTerminalNone => 'Walang bukas na terminal';

  @override
  String get botsTerminalNew => 'Bagong terminal';

  @override
  String get botsTerminalClose => 'Isara ang terminal';

  @override
  String get botsTerminalChooseShell => 'Pumili ng shell';

  @override
  String get botsTerminalShellFailed => 'Hindi ma-load ang mga shell';

  @override
  String get botsTerminalReading => 'Binabasa…';

  @override
  String get botsTerminalDefaultShell => 'Default na shell';

  @override
  String get botsTerminalOtherDevice => 'May ibang device na nagta-type';

  @override
  String get botsTerminalTakeOver => 'Pumalit';

  @override
  String get botsTerminalStarting => 'Nagsisimula…';

  @override
  String get botsTerminalConnecting => 'Kumokonekta…';

  @override
  String get botsTerminalDisconnected => 'Naka-disconnect';

  @override
  String get botsTerminalReconnect => 'Kumonekta muli';

  @override
  String get botsTerminalEnded => 'Tapos na';

  @override
  String botsTerminalExitCode(int code) {
    return 'Tapos na · Exit code $code';
  }

  @override
  String get botsTerminalGone => 'Wala na ang terminal na ito';

  @override
  String get botsTerminalLimit => 'Isara muna ang mga hindi ginagamit na terminal';

  @override
  String get botsToolWorkingRun => 'Nagpapatakbo ng mga command';

  @override
  String botsToolApprovalRun(String name) {
    return 'Gustong magpatakbo ng mga command ni $name';
  }

  @override
  String get botsToolWorkingRead => 'Tumitingin ng mga file';

  @override
  String botsToolApprovalRead(String name) {
    return 'Gustong tumingin ng mga file ni $name';
  }

  @override
  String get botsToolWorkingEdit => 'Nag-eedit ng mga file';

  @override
  String botsToolApprovalEdit(String name) {
    return 'Gustong mag-edit ng mga file ni $name';
  }

  @override
  String get botsToolWorkingSearch => 'Naghahanap sa web';

  @override
  String botsToolApprovalSearch(String name) {
    return 'Gustong maghanap sa web ni $name';
  }

  @override
  String get botsToolWorkingBrowse => 'Nagba-browse sa web';

  @override
  String botsToolApprovalBrowse(String name) {
    return 'Gustong mag-browse sa web ni $name';
  }

  @override
  String get botsToolWorkingMessage => 'Nakikipag-ugnayan sa ibang bot';

  @override
  String botsToolApprovalMessage(String name) {
    return 'Gustong makipag-ugnayan ni $name sa ibang bot';
  }

  @override
  String get botsToolWorkingGroup => 'Nakikipag-chat sa grupo';

  @override
  String botsToolApprovalGroup(String name) {
    return 'Gustong makipag-chat ni $name sa grupo';
  }

  @override
  String get botsToolWorkingMemory => 'Nag-aayos ng mga alaala';

  @override
  String botsToolApprovalMemory(String name) {
    return 'Gustong mag-ayos ng mga alaala ni $name';
  }

  @override
  String get botsToolWorkingRecall => 'Sinusuri ang mga talaan';

  @override
  String botsToolApprovalRecall(String name) {
    return 'Gustong suriin ni $name ang mga talaan';
  }

  @override
  String get botsToolWorkingTeam => 'Inaayos ang team';

  @override
  String botsToolApprovalTeam(String name) {
    return 'Gustong ayusin ni $name ang team';
  }

  @override
  String get botsToolWorkingAsk => 'Naghahandang magtanong sa iyo';

  @override
  String botsToolApprovalAsk(String name) {
    return 'May gustong itanong sa iyo si $name';
  }

  @override
  String get botsToolWorkingWork => 'Gumagana';

  @override
  String botsToolApprovalWork(String name) {
    return 'Gustong magtrabaho ni $name';
  }

  @override
  String get botsEveryone => 'Lahat';

  @override
  String get botsActivelyRunning => 'Tumatakbo';

  @override
  String get botsListSeparator => ',';

  @override
  String get botsNameSeparator => ',';

  @override
  String get botsGlyphSubagent => 'Subagent';

  @override
  String get botsGlyphWebSearch => 'Paghahanap sa web';

  @override
  String botsSenderPreview(String name, String preview) {
    return '$name: $preview';
  }

  @override
  String botsAgentSemantics(String title, String state) {
    return '$title, $state';
  }

  @override
  String botsViewMetric(Object label, Object value) {
    return '$label: $value';
  }

  @override
  String get botsEffortXhigh => 'Napakataas';

  @override
  String get botsRelayLimit => 'Limitasyon ng Bot relay';

  @override
  String get botsRelayLimitHint =>
      'I-pause pagkatapos ng ganito karaming Bot-to-Bot na tawag mula sa huli mong mensahe. Maglagay ng buong numero mula 1 hanggang 200, o iwanang walang laman para sa default.';

  @override
  String botsRelayLimitDefault(int count) {
    return 'Default: $count';
  }

  @override
  String get botsRelayLimitInvalid => 'Maglagay ng buong numero mula 1 hanggang 200.';

  @override
  String get botsRelayLimitRestore => 'Ibalik ang default';

  @override
  String get botsRelayLimitConnectionChanged => 'Nagbago ang koneksyon. Isara ang sheet na ito at buksan muli.';

  @override
  String get botsMobileUnsupportedTitle => 'Wala pa sa mobile ang DS Bot';

  @override
  String get botsMobileApiRequired => 'Gamitin muna ito sa JDK Web';

  @override
  String get botsMobileApiMissing => 'Wala pa sa mobile. Gamitin muna ito sa JDK Web';

  @override
  String get botsCreationConnectionChanged =>
      'Nagbago ang koneksyon. Buksan muli ang form na ito para lumikha sa kasalukuyang host.';

  @override
  String get brandXiaomi => 'Xiaomi / Redmi';

  @override
  String get brandHuawei => 'Huawei';

  @override
  String get brandHonor => 'Honor';

  @override
  String get brandOppo => 'OPPO / OnePlus / realme';

  @override
  String get brandSamsung => 'Samsung';

  @override
  String get brandVivoOs => 'vivo / iQOO (OriginOS)';

  @override
  String get brandXiaomiOs => 'Xiaomi / Redmi (HyperOS, MIUI)';

  @override
  String get brandHuaweiOs => 'Huawei / Honor (HarmonyOS, MagicOS)';

  @override
  String get brandOppoOs => 'OPPO / OnePlus / realme (ColorOS)';

  @override
  String get brandSamsungOs => 'Samsung (One UI)';

  @override
  String get brandZhihu => 'Zhihu';

  @override
  String get catalogCurrentChat => 'Kasalukuyang chat';

  @override
  String get catalogChatDetails => 'Mga detalye ng chat';

  @override
  String get catalogChatDetailsSummary => 'Trajectory, mga pagbabago at progreso';

  @override
  String get catalogArtifacts => 'Mga output file';

  @override
  String get catalogArtifactsSummary => 'I-preview, ibahagi at i-save';

  @override
  String get catalogFiles => 'Mga file';

  @override
  String get catalogFilesSummary => 'Mag-browse at mag-preview';

  @override
  String get catalogTerminal => 'Terminal';

  @override
  String get catalogTerminalSummary => 'Terminal ng workspace';

  @override
  String get catalogExport => 'I-export ang chat log';

  @override
  String get catalogExportSummary => 'I-save bilang ZIP';

  @override
  String get catalogJobs => 'Mga background job';

  @override
  String get catalogJobsSummary => 'Tingnan ang output o ihinto ang mga job';

  @override
  String get catalogPlanGoal => 'Plano at layunin';

  @override
  String get catalogPlanGoalSummary => 'Mga layunin, plano at to-do';

  @override
  String get catalogSkills => 'Mga skill';

  @override
  String get catalogSkillsSummary => 'Gumamit ng mga skill sa mga chat';

  @override
  String get catalogSubagents => 'Mga subagent';

  @override
  String get catalogSubagentsSummary => 'Lineage at katayuan; i-tap para makipag-chat';

  @override
  String get catalogReference => 'I-reference ang mga file at chat';

  @override
  String get catalogReferenceSummary => 'Gamitin ang @ sa composer';

  @override
  String get catalogAutomationSection => 'Automation';

  @override
  String get catalogSchedules => 'Mga automation';

  @override
  String get catalogSchedulesSummary => 'Mga nakaiskedyul at paulit-ulit na gawain';

  @override
  String get catalogAgentModelsSection => 'Mga agent at model';

  @override
  String get catalogPermission => 'Mga pahintulot';

  @override
  String get catalogPermissionSummary => 'Piliin kung kailan hihingi ng pag-apruba';

  @override
  String get catalogAgentPresets => 'Mga agent preset';

  @override
  String get catalogAgentPresetsSummary => 'Paano gumagana ang mga bagong chat';

  @override
  String get catalogModels => 'Mga model';

  @override
  String get catalogModelsSummary => 'Mga subscription at custom na provider';

  @override
  String get catalogSubagentSettings => 'Mga setting ng subagent';

  @override
  String get catalogSubagentSettingsSummary => 'Lalim, parallelism at mga model';

  @override
  String get catalogAgentLoop => 'Agent loop';

  @override
  String get catalogAgentLoopSummary => 'Limitasyon ng parallel tool call';

  @override
  String get catalogShellSettings => 'Pagpapatupad ng command';

  @override
  String get catalogShellSettingsSummary => 'Mga timeout at limitasyon ng output';

  @override
  String get catalogWebSearch => 'Paghahanap sa web';

  @override
  String get catalogWebSearchSummary => 'Serbisyo sa paghahanap at badyet';

  @override
  String get catalogPlugins => 'Mga plugin';

  @override
  String get catalogPluginsSummary => 'Mga naka-install na plugin at market';

  @override
  String get catalogPluginInventory => 'Imbentaryo ng plugin';

  @override
  String get catalogPluginInventorySummary => 'Lahat ng na-load na plugin';

  @override
  String get catalogCordisSummary => 'Mga dynamic na panel mula sa mga plugin';

  @override
  String get catalogAgentTeam => 'Agent team';

  @override
  String get catalogAgentTeamSummary => 'Mga miyembro, task board at mga mensahe';

  @override
  String get catalogCotTranslation => 'Isalin ang pag-iisip';

  @override
  String get catalogCotTranslationSummary => 'Palawakin ang pag-iisip, saka i-tap ang “Isalin”';

  @override
  String get catalogVoiceInput => 'Voice input';

  @override
  String get catalogVoiceInputSummary => 'Mikropono sa composer';

  @override
  String get catalogCommunitySharingSection => 'Komunidad at pagbabahagi';

  @override
  String get catalogForum => 'Forum';

  @override
  String get catalogForumSummary => 'Magtanong, magbahagi at makilala ang iba';

  @override
  String get catalogCommunity => 'Komunidad';

  @override
  String get catalogCommunitySummary => 'Mga highlight at group chat';

  @override
  String get catalogBotSummary => 'Mga bot team at group chat';

  @override
  String get catalogShareProfile => 'Ibahagi ang configuration';

  @override
  String get catalogShareProfileSummary => 'Mga plugin, setting at skill';

  @override
  String get catalogHostsSettingsSection => 'Mga host at setting';

  @override
  String get catalogSearch => 'Maghanap ng mga chat';

  @override
  String get catalogSearchSummary => 'Maghanap ayon sa pamagat o nilalaman';

  @override
  String get catalogNotifications => 'Mga notification';

  @override
  String get catalogNotificationsSummary => 'Mga alerto sa pagkumpleto at pag-apruba';

  @override
  String get catalogWorkspaces => 'Mga workspace';

  @override
  String get catalogWorkspacesSummary => 'Magdagdag at lumipat ng mga folder';

  @override
  String get catalogGeneral => 'Pangkalahatan';

  @override
  String get catalogGeneralSummary => 'Display, pagpapadala at pag-upload ng log';

  @override
  String get catalogAccount => 'Account';

  @override
  String get catalogAccountSummary => 'Mag-sign in, balanse at top-up';

  @override
  String get catalogRemoteSummary => 'Kumonekta sa computer o server';

  @override
  String get catalogPhoneControl => 'Phone control';

  @override
  String get catalogPhoneControlSummary => 'Tingnan ang iyong screen at mag-tap para sa iyo';

  @override
  String get catalogEngine => 'Lokal na engine';

  @override
  String get catalogEngineSummary => 'Katayuan at mga log ng engine sa telepono na ito';

  @override
  String get catalogDiagnostics => 'Diagnostics';

  @override
  String get catalogDiagnosticsSummary => 'I-export ang diagnostics bundle';

  @override
  String get catalogWebSummary => 'Opisyal na JDK interface';

  @override
  String get catalogPluginPanel => 'Panel ng plugin';

  @override
  String get catalogHostPluginMissing => 'Wala sa host na ito ang plugin na ito';

  @override
  String get catalogAllFeatures => 'Lahat ng feature';

  @override
  String get catalogAllFeaturesSubtitle => 'Lahat ng feature ng JDK Web, narito';

  @override
  String get catalogOpenChatFirst => 'Magbukas muna ng chat';

  @override
  String get catalogNoOpenChat => 'Walang bukas na chat';

  @override
  String get catalogOpenChat => 'Kasalukuyang bukas na chat';

  @override
  String get catalogOpenOrCreateChat => 'Magbukas o magsimula muna ng chat';

  @override
  String get catalogCordisHostClient => 'Backend at interface';

  @override
  String get catalogCordisHostOnly => 'Backend lang';

  @override
  String get catalogCordisClientOnly => 'Interface lang';

  @override
  String get catalogCordisPluginGone => 'Wala na ang plugin na ito';

  @override
  String get catalogCordisStopFailed => 'Hindi mahinto';

  @override
  String get catalogCordisRemoveOne => 'Ihihinto at buburahin nito ito.';

  @override
  String get catalogCordisRemove => 'Alisin';

  @override
  String get catalogCordisRemoved => 'Naalis';

  @override
  String get catalogCordisRemoveFailed => 'Hindi maalis';

  @override
  String get catalogCordisChat => 'Chat';

  @override
  String get catalogCordisMakeup => 'Mga component';

  @override
  String get catalogCordisStopping => 'Humihinto…';

  @override
  String get catalogCordisRemoving => 'Inaalis…';

  @override
  String get catalogSeatGone => 'Hindi na available ang plugin';

  @override
  String catalogCordisRemoveTitle(String name) {
    return 'Alisin ang “$name”?';
  }

  @override
  String catalogCordisRemoveVersions(int versions) {
    String _temp0 = intl.Intl.pluralLogic(
      versions,
      locale: localeName,
      other: 'Ihihinto nito ito at buburahin ang lahat ng $versions bersyon.',
      one: 'Ihihinto nito ito at buburahin ang 1 bersyon.',
    );
    return '$_temp0';
  }

  @override
  String catalogCordisVersionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bersyon', one: '1 bersyon');
    return '$_temp0';
  }

  @override
  String get catalogToolsSection => 'Mga tool';

  @override
  String get catalogAllSettings => 'Lahat ng setting';

  @override
  String get diagnosticsForAi => 'Hayaang basahin ng AI ang diagnostics';

  @override
  String get diagnosticsForAiHint => 'Isulat ang snapshot kung saan ito mababasa ng engine';

  @override
  String get diagnosticsForAiDone => 'Naisulat — hilingin sa AI na \"suriin ang diagnostics\"';

  @override
  String get diagnosticsForAiFailed => 'Hindi naisulat: hindi naka-install ang lokal na runtime';

  @override
  String get chatBackgroundTaskNotice => 'Abiso ng background task';

  @override
  String get chatBackgroundTaskMessage => 'Mensahe ng background task';

  @override
  String get chatDeclineQuestion => 'Laktawan';

  @override
  String get chatChats => 'Mga chat';

  @override
  String get chatViewChatDetails => 'Tingnan ang mga detalye ng chat';

  @override
  String get chatUnsent => 'Hindi naipadala';

  @override
  String get chatFailedSubmission => 'Nabigo · Napanatili ang input';

  @override
  String get chatEditFailedSubmission => 'I-edit at ipadala muli';

  @override
  String get chatErrReasoningEffortUnsupported =>
      'Hindi sinusuportahan ng model na ito ang napiling reasoning effort. Baguhin ang effort o model.';

  @override
  String get chatSteerNextStep => 'Gabayan · Susunod na hakbang';

  @override
  String get chatQueuedAfterTurn => 'Nakapila · Susunod na turn';

  @override
  String get chatSteering => 'Ginagabayan';

  @override
  String get chatQueued => 'Nakapila';

  @override
  String get chatStoppingTurn => 'Itinitigil ang turn na ito';

  @override
  String get chatSending => 'Ipinapadala';

  @override
  String get chatSendNow => 'Ipadala ngayon';

  @override
  String get chatSwitchToSteer => 'Gabayan na lang';

  @override
  String get chatWithdraw => 'I-undo';

  @override
  String get chatContinuedInNewChat => 'Ipinagpatuloy sa bagong chat';

  @override
  String get chatReadOriginalImageFailed => 'Hindi mabasa ang orihinal na larawan. Subukang muli.';

  @override
  String get chatRegenerateFailed => 'Hindi mabuo muli';

  @override
  String get chatRegeneratedInNewChat => 'Muling nabuo sa bagong chat';

  @override
  String get chatOpenedInNewChatReattach => 'Binuksan sa bagong chat. Idagdag muli ang mga attachment.';

  @override
  String get chatOpenedInNewChat => 'Binuksan sa bagong chat';

  @override
  String chatForkQueuedLeft(String message, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      left,
      locale: localeName,
      other: '$message ($left nakapilang mensahe ang naiwan)',
      one: '$message (1 nakapilang mensahe ang naiwan)',
    );
    return '$_temp0';
  }

  @override
  String get chatReturnToOriginal => 'Bumalik sa orihinal na chat';

  @override
  String chatWaitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item ang nangangailangan ng pag-apruba',
      one: '1 item ang nangangailangan ng pag-apruba',
    );
    return '$_temp0';
  }

  @override
  String chatWaitingBackToBottom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item ang nangangailangan ng pag-apruba, bumalik sa ibaba',
      one: '1 item ang nangangailangan ng pag-apruba, bumalik sa ibaba',
    );
    return '$_temp0';
  }

  @override
  String get chatBackToBottom => 'Bumalik sa ibaba';

  @override
  String get chatCreateFailed => 'Hindi makalikha ng chat';

  @override
  String get chatSendMode => 'Send mode';

  @override
  String get chatSteer => 'Gabayan';

  @override
  String get chatSteerHint => 'Makikita ito ng AI sa susunod na hakbang, nang hindi nag-iistorbo';

  @override
  String get chatInterruptAndSend => 'Putulin at ipadala';

  @override
  String get chatInterruptHint => 'Itigil ang kasalukuyang gawain at asikasuhin muna ito';

  @override
  String get chatQueue => 'Ipila';

  @override
  String get chatQueueHint => 'Ipadala pagkatapos ng turn na ito';

  @override
  String get chatWithdrawnEditable => 'Na-undo. I-edit at ipadala muli.';

  @override
  String get chatWithdrawn => 'Na-undo';

  @override
  String chatAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hanggang $count attachment bawat mensahe',
      one: 'Hanggang 1 attachment bawat mensahe',
    );
    return '$_temp0';
  }

  @override
  String get chatAttachmentPermission => 'Tinanggihan ang pahintulot. I-on ito sa system settings.';

  @override
  String get chatOpenAttachmentFailed => 'Hindi mabuksan ang attachment';

  @override
  String get chatReadFailed => 'Hindi mabasa';

  @override
  String get chatReadImageFailed => 'Hindi mabasa ang larawan';

  @override
  String get chatOpenChatFirst => 'Magbukas muna ng chat';

  @override
  String get chatTurnCompleted => 'Tapos na ang turn na ito';

  @override
  String get chatTurnError => 'Nagkaproblema sa turn na ito';

  @override
  String get chatAnswerHint => 'I-type ang iyong sagot…';

  @override
  String get chatStarting => 'Nagsisimula';

  @override
  String get chatConnecting => 'Kumokonekta';

  @override
  String get chatDisconnected => 'Naka-disconnect';

  @override
  String get chatReconnecting => 'Muling kumokonekta';

  @override
  String get chatGenerating => 'Bumubuo';

  @override
  String get chatGoToSettings => 'Buksan ang settings';

  @override
  String get chatListeningEllipsis => 'Nakikinig…';

  @override
  String get chatTranscribingEllipsis => 'Nagta-transcribe…';

  @override
  String get chatConnectToSend => 'Kumonekta sa engine para magpadala';

  @override
  String get chatGeneratingSteerHint => 'Bumubuo · Mag-type para gabayan';

  @override
  String get chatComposerHint => 'Mensahe sa JDK…';

  @override
  String get chatStopGenerating => 'Ihinto ang pagbuo';

  @override
  String get chatVoiceInput => 'Voice input';

  @override
  String get chatStopVoiceInput => 'Ihinto ang voice input';

  @override
  String get chatGoal => 'Layunin';

  @override
  String get chatGoalActions => 'Mga aksyon ng layunin';

  @override
  String get chatGoalBlocked => 'Naharang';

  @override
  String chatGoalRoundLimit(int rounds, int max) {
    return 'Round $rounds / $max';
  }

  @override
  String chatGoalRound(int rounds) {
    return 'Round $rounds';
  }

  @override
  String get chatEditGoal => 'I-edit ang layunin';

  @override
  String get chatPauseGoal => 'I-pause';

  @override
  String get chatPauseGoalHint => 'I-pause ang awtomatikong progreso';

  @override
  String get chatResumeGoal => 'Ituloy';

  @override
  String get chatResumeGoalHint => 'Ituloy ang awtomatikong progreso';

  @override
  String get chatClearGoal => 'I-clear ang layunin';

  @override
  String get chatGoalHint => 'Ano ang gusto mong makamit?';

  @override
  String get chatClearGoalTitle => 'I-clear ang layunin?';

  @override
  String chatTodoCurrent(String content) {
    return 'Ginagawa: $content';
  }

  @override
  String chatTodoNext(String content) {
    return 'Susunod: $content';
  }

  @override
  String get chatTodoAllDone => 'Tapos na lahat';

  @override
  String chatTodoSemantics(String count, String label) {
    return 'To-do $count, $label';
  }

  @override
  String get chatCollapseTodos => 'I-collapse ang listahan';

  @override
  String get chatExpandTodos => 'Palawakin ang listahan';

  @override
  String chatDockFolded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count status bar ang nakapatong',
      one: '1 status bar ang nakapatong',
    );
    return '$_temp0';
  }

  @override
  String get chatDockSpread => 'Palawakin';

  @override
  String get chatDockFold => 'I-fold ang mga status bar';

  @override
  String get chatDockNext => 'Susunod na card';

  @override
  String get chatDockPrevious => 'Nakaraang card';

  @override
  String get chatTodoNotStarted => 'Hindi pa nasimulan';

  @override
  String get chatFile => 'File';

  @override
  String get chatFolder => 'Folder';

  @override
  String get chatChat => 'Chat';

  @override
  String get chatSubagent => 'Subagent';

  @override
  String get chatRecent => 'Kamakailan';

  @override
  String get chatMentionSearching => 'Naghahanap…';

  @override
  String get chatMentionNoFiles => 'Walang tumutugmang file';

  @override
  String get chatMentionNoMatches => 'Walang tumutugmang file o chat';

  @override
  String get chatQuote => 'Sipi';

  @override
  String get chatOpenFolder => 'Buksan ang folder';

  @override
  String get chatJustNow => 'Ngayon lang';

  @override
  String chatMentionAgeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String chatMentionAgeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count oras', one: '1 oras');
    return '$_temp0';
  }

  @override
  String chatMentionAgeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count araw', one: '1 araw');
    return '$_temp0';
  }

  @override
  String chatMentionAgeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count buwan', one: '1 buwan');
    return '$_temp0';
  }

  @override
  String chatMentionAgeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count taon', one: '1 taon');
    return '$_temp0';
  }

  @override
  String get chatMermaidChart => 'Mermaid chart';

  @override
  String get chatPreview => 'Preview';

  @override
  String get chatUnwrapLines => 'Alisin ang pag-wrap ng mga linya';

  @override
  String get chatWrapLines => 'I-wrap ang mga linya';

  @override
  String get chatAlertNote => 'Tala';

  @override
  String get chatAlertTip => 'Tip';

  @override
  String get chatAlertImportant => 'Mahalaga';

  @override
  String get chatAlertWarning => 'Babala';

  @override
  String get chatAlertCaution => 'Pag-iingat';

  @override
  String get chatImage => 'Larawan';

  @override
  String get chatImageNotFound => 'Hindi nahanap ang larawan';

  @override
  String get chatImageOffline => 'Hindi nakakonekta sa JDK';

  @override
  String get chatImageTooLarge => 'Masyadong malaki ang larawan';

  @override
  String get chatImageReadFailed => 'Hindi mabasa ang file';

  @override
  String get chatImageDisplayFailed => 'Hindi maipakita';

  @override
  String get chatImageTapToView => 'I-tap para tingnan';

  @override
  String get chatImageTapToRetry => 'I-tap para subukang muli';

  @override
  String get chatImageUnsupportedAddress => 'Hindi sinusuportahang address';

  @override
  String get chatMermaidNeedsNetwork => 'Kailangan ng internet';

  @override
  String get chatMermaidSyntaxError => 'Di-wastong syntax ng chart';

  @override
  String get chatChartPreview => 'Preview ng chart';

  @override
  String get chatCopyCode => 'Kopyahin ang code';

  @override
  String get chatChartClosed => 'Nagsara ang chart';

  @override
  String get chatVoiceMicrophoneFailed => 'Hindi mabuksan ang mikropono';

  @override
  String get chatVoicePermissionOff => 'Naka-off ang access sa mikropono';

  @override
  String get chatVoicePermissionNeeded => 'Kailangan ng voice input ang access sa mikropono';

  @override
  String get chatVoiceUnavailable => 'Hindi available sa telepono na ito ang speech recognition';

  @override
  String get chatVoiceNotHeard => 'Hindi narinig nang malinaw. Subukang muli.';

  @override
  String get chatVoiceTranscriptionFailed => 'Hindi ma-transcribe ang recording na ito';

  @override
  String get chatVoiceNetworkFailed => 'Hindi ma-transcribe. Suriin ang iyong koneksyon.';

  @override
  String get chatVoiceLanguageUnsupported => 'Hindi pa sinusuportahan ang wikang ito';

  @override
  String get chatVoiceMicrophoneBusy => 'Ginagamit ang mikropono';

  @override
  String get chatVoiceBusy => 'Abala ang speech recognition. Subukang muli mamaya.';

  @override
  String get chatVoiceRecognitionFailed => 'Nabigo ang speech recognition';

  @override
  String get chatListening => 'Nakikinig';

  @override
  String get chatTranscribing => 'Nagta-transcribe';

  @override
  String get chatCancelVoiceInput => 'Kanselahin ang voice input';

  @override
  String get chatViewTurnTrace => 'Tingnan ang trajectory ng turn';

  @override
  String chatTokensPerSecond(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Humigit-kumulang $count token/s',
      one: 'Humigit-kumulang 1 token/s',
    );
    return '$_temp0';
  }

  @override
  String get chatNoTokensStreaming => 'Walang text streaming';

  @override
  String chatCurrentStep(String step) {
    return 'Hakbang na ito $step';
  }

  @override
  String chatTodoProgress(int done, int total) {
    return 'Progreso ng to-do $done/$total';
  }

  @override
  String chatProgress(int done, int total) {
    return 'Progreso $done/$total';
  }

  @override
  String get chatApproveCommand => 'Payagan ang command na ito?';

  @override
  String get chatApproveWrite => 'Payagang isulat ang file na ito?';

  @override
  String get chatApproveEdit => 'Payagang i-edit ang file na ito?';

  @override
  String get chatApproveWebpage => 'Payagang buksan ang pahinang ito?';

  @override
  String get chatApproveSearch => 'Payagan ang paghahanap sa web?';

  @override
  String chatApproveTool(String name) {
    return 'Payagan ang “$name”?';
  }

  @override
  String get chatDecline => 'Tanggihan';

  @override
  String get chatAllowOnce => 'Payagan nang isang beses';

  @override
  String get chatAllowForChat => 'Payagan para sa chat';

  @override
  String get chatSaveToDownloads => 'I-save sa Downloads';

  @override
  String get chatCopyPath => 'Kopyahin ang path';

  @override
  String get chatOpenInDefaultApp => 'Buksan sa default na app';

  @override
  String get chatDownloadsFolderHint => 'Downloads/DSH-Go folder';

  @override
  String chatSavedToDownloadsPath(String path) {
    return 'Na-save sa Downloads/$path';
  }

  @override
  String chatSavedToPath(String path) {
    return 'Na-save sa $path';
  }

  @override
  String chatDeliveredFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Naihatid ang $count file',
      one: 'Naihatid ang 1 file',
    );
    return '$_temp0';
  }

  @override
  String chatGeneratedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nabuo ang $count file',
      one: 'Nabuo ang 1 file',
    );
    return '$_temp0';
  }

  @override
  String chatAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lahat ng $count file',
      one: '1 file sa kabuuan',
    );
    return '$_temp0';
  }

  @override
  String get chatCollapseFileList => 'I-collapse ang listahan ng file';

  @override
  String chatExpandAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Palawakin ang lahat ng $count file',
      one: 'Palawakin ang 1 file',
    );
    return '$_temp0';
  }

  @override
  String get chatDownloading => 'Dina-download…';

  @override
  String chatDownloadingPercent(int percent) {
    return 'Dina-download… $percent%';
  }

  @override
  String get chatOpening => 'Binubuksan…';

  @override
  String get chatSavingToDownloads => 'Sine-save sa Downloads…';

  @override
  String get chatOpenInPhoneApp => 'Buksan sa isang app sa telepono na ito';

  @override
  String get chatMoreActions => 'Higit pang mga aksyon';

  @override
  String get chatAlreadyInDownloads => 'Nasa Downloads na sa telepono na ito';

  @override
  String get chatArtifactCopyPathOnly =>
      'Hindi makabasa ng mga file ang koneksyong ito. Maaari mong kopyahin ang path.';

  @override
  String get chatReplying => 'Sumasagot';

  @override
  String get chatInterrupted => 'Naantala';

  @override
  String get chatGallery => 'Mga larawan';

  @override
  String get chatTakePhoto => 'Kumuha ng larawan';

  @override
  String get chatAddAttachment => 'Magdagdag ng larawan o file';

  @override
  String chatRemoveAttachment(String name) {
    return 'Alisin ang “$name”';
  }

  @override
  String get chatAutoApproveCommands => 'Awtomatikong payagan ang mga command';

  @override
  String get chatAutoApproving => 'Awtomatikong inaaprubahan';

  @override
  String chatViewMoreChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tingnan ang mga pagbabago, $count pang file',
      one: 'Tingnan ang mga pagbabago, 1 pang file',
    );
    return '$_temp0';
  }

  @override
  String get chatViewChanges => 'Tingnan ang mga pagbabago';

  @override
  String chatChangedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file ang nabago',
      one: '1 file ang nabago',
    );
    return '$_temp0';
  }

  @override
  String chatMoreFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count pang file', one: '1 pang file');
    return '$_temp0';
  }

  @override
  String chatFileChangeSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: '$added linya ang idinagdag',
      one: '1 linya ang idinagdag',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed linya ang binura',
      one: '1 linya ang binura',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String get chatNewFileSuffix => '  Bago';

  @override
  String get chatPathCopied => 'Nakopya ang path';

  @override
  String chatCommandCompacted(int count, String tokens) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-compact ang $count history item (~$tokens token)',
      one: 'Na-compact ang 1 history item (~$tokens token)',
    );
    return '$_temp0';
  }

  @override
  String chatCommandPermissionChanged(String name) {
    return 'Lumipat sa $name';
  }

  @override
  String chatCommandCurrentPermission(String name) {
    return 'Kasalukuyang mga pahintulot: $name';
  }

  @override
  String get chatCommandUnknownPermission => 'Walang ganoong permission preset';

  @override
  String get chatCommandFeedbackRequired => 'Magdagdag ng feedback bago magpadala';

  @override
  String get chatCommandFeedbackSubmitted => 'Naisumite ang feedback';

  @override
  String get chatCommandNothingToCompact => 'Wala pang i-co-compact';

  @override
  String get chatCommandCompactionCancelled => 'Kinansela ang compaction';

  @override
  String get chatCommandCompactionBusy => 'Abala. Subukang mag-compact mamaya.';

  @override
  String get chatCommandCompactedSaveFailed => 'Na-compact, ngunit hindi ma-save';

  @override
  String get chatCommandCompactUsage => 'Walang tinatanggap na argumento ang /compact';

  @override
  String get chatCommandHistoryChanged => 'Nagbago ang chat. Subukang muli.';

  @override
  String get chatCommandCompactionFailed => 'Hindi ma-compact. Subukang muli.';

  @override
  String get chatCommandCompactionIncomplete => 'Hindi kumpleto ang compaction. Suriin ang chat.';

  @override
  String get chatCommandPlanEnabled => 'Naka-on ang plan mode';

  @override
  String get chatCommandPlanEnabling => 'Magsisimula ang plan mode sa susunod na hakbang';

  @override
  String get chatCommandPlanDisabled => 'Naka-off ang plan mode';

  @override
  String get chatCommandPlanDisabling => 'Magtatapos ang plan mode sa susunod na hakbang';

  @override
  String get chatCommandPlanCancelled => 'Kinansela ang pagpasok sa plan mode';

  @override
  String get chatCommandPlanInactive => 'Naka-off ang plan mode';

  @override
  String get chatCommandPlanNoAttachments => 'Hindi makapag-attach ng mga file kapag lumalabas sa plan mode';

  @override
  String get chatCommandNoGoal => 'Wala pang layunin';

  @override
  String get chatCommandGoalRequired => 'Magdagdag ng bagong layunin bago magpadala';

  @override
  String get chatCommandGoalAttachments => 'Magpadala ng mga attachment kasama ang layunin';

  @override
  String get chatCommandGoalCleared => 'Na-clear ang layunin';

  @override
  String get chatCommandGoalInvalid => 'Hindi magawa ngayon. Suriin ang layunin.';

  @override
  String get chatCommandGoalExists => 'May umiiral nang layunin. I-edit o i-clear muna ito.';

  @override
  String get chatCommandGoalCreated => 'Naitakda ang layunin';

  @override
  String get chatCommandGoalUpdated => 'Na-update ang layunin';

  @override
  String get chatCommandGoalPaused => 'Na-pause ang layunin';

  @override
  String get chatCommandGoalResumed => 'Itinuloy ang layunin';

  @override
  String get chatCommandCurrentGoal => 'Kasalukuyang layunin';

  @override
  String get chatCommandGoalBlocked => 'Kailangan ng atensyon';

  @override
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max) {
    return '$title\n$objective\n$status · Round $rounds/$max';
  }

  @override
  String get chatCommandFailed => 'Nabigo ang command';

  @override
  String get chatImageStorageDenied => 'Hindi na-save. Naka-off ang access sa storage.';

  @override
  String get chatImageCannotSave => 'Hindi ma-save ang larawang ito';

  @override
  String get chatImageDownloadFailed => 'Hindi ma-download ang larawan. Subukang muli.';

  @override
  String get chatImageSaveFailed => 'Hindi na-save. Subukang muli.';

  @override
  String get chatImageSavedToPhotos => 'Na-save sa Photos';

  @override
  String get chatShareFailed => 'Hindi mabuksan ang pagbabahagi';

  @override
  String get chatSubmit => 'Isumite';

  @override
  String get chatSelectText => 'Pumili ng teksto';

  @override
  String get chatRegenerate => 'Buuin muli';

  @override
  String get chatBranchFromHere => 'Mag-branch dito';

  @override
  String get chatEditAndResend => 'I-edit at ipadala muli';

  @override
  String get chatRegenerateHint => 'Buuin muli sa bagong chat. Mananatili ang orihinal.';

  @override
  String get chatBranchHint => 'Magpatuloy sa bagong chat. Mananatili ang orihinal.';

  @override
  String get chatEditResendHint => 'Isulat muli sa bagong chat. Mananatili ang orihinal.';

  @override
  String get chatSaveToPhotos => 'I-save sa Photos';

  @override
  String get chatCopyAll => 'Kopyahin lahat';

  @override
  String get chatRequestRetrying => 'Nabigo ang request, sinusubukang muli';

  @override
  String chatRequestRetryAttempt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nabigo ang request, sinusubukang muli (pagtatangka $count)',
      one: 'Nabigo ang request, sinusubukang muli (pagtatangka 1)',
    );
    return '$_temp0';
  }

  @override
  String chatRequestRetryLimit(int count, int max) {
    return 'Nabigo ang request, sinusubukang muli ($count/$max)';
  }

  @override
  String chatSubscriptionExpired(String name) {
    return 'Nag-expire ang sign-in sa $name';
  }

  @override
  String get chatProviderKeyMissing => 'Wala pang API key para sa provider na ito';

  @override
  String get chatDeepSeekKeyMissing => 'Wala pang DeepSeek API key';

  @override
  String get chatOutputLimitReached => 'Naabot ang limitasyon ng output';

  @override
  String get chatTurnBlocked => 'Naharang ang turn na ito';

  @override
  String get chatTurnEngineRestarted => 'Nag-restart ang engine, na pumutol sa turn na ito';

  @override
  String get chatSignInAgain => 'Mag-sign in muli';

  @override
  String chatQuestionsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tanong para sa iyo',
      one: '1 tanong para sa iyo',
    );
    return '$_temp0';
  }

  @override
  String get chatOneQuestion => 'Isang tanong para sa iyo';

  @override
  String get chatMultipleChoices => 'Pumili ng anuman';

  @override
  String get chatCustomAnswer => 'Ibang sagot';

  @override
  String get chatCustomAnswerHint => 'I-type ang iyong sagot';

  @override
  String chatQuoteSemantics(String text) {
    return 'Sipi: $text';
  }

  @override
  String get chatRemoveQuote => 'Alisin ang sipi';

  @override
  String get chatReadOnlySubagent => 'One-shot subagent · Tingnan lang';

  @override
  String get chatThinkingActive => 'Nag-iisip';

  @override
  String get chatThinking => 'Nag-iisip';

  @override
  String get chatTranslate => 'Isalin';

  @override
  String get chatTranslationUnavailable => 'Hindi available ang pagsasalin';

  @override
  String get chatViewOriginal => 'Tingnan ang orihinal';

  @override
  String get chatViewTranslation => 'Tingnan ang salin';

  @override
  String get chatTranslating => 'Isinasalin';

  @override
  String chatToolFailures(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label, $count ang nabigo',
      one: '$label, 1 ang nabigo',
    );
    return '$_temp0';
  }

  @override
  String get chatToolNeedsApproval => 'Kailangan ng pag-apruba para tumakbo';

  @override
  String get chatCommand => 'Command';

  @override
  String chatToolLineRange(int first, int last) {
    return ' · Mga linya $first⁠–⁠$last';
  }

  @override
  String get chatParameters => 'Mga parameter';

  @override
  String get chatOutput => 'Output';

  @override
  String get chatResult => 'Resulta';

  @override
  String get chatError => 'Error';

  @override
  String get chatChanges => 'Mga pagbabago';

  @override
  String get chatContent => 'Nilalaman';

  @override
  String get chatNoOutput => 'Walang output';

  @override
  String get chatToolDeclined => 'Tinanggihan ang tool call na ito';

  @override
  String get chatToolRunning => 'Tumatakbo…';

  @override
  String get chatNoDetails => 'Wala pang mga detalye';

  @override
  String get chatErrApiKey => 'Di-wasto o expired ang API key';

  @override
  String get chatErrBalance => 'Kulang ang balanse';

  @override
  String get chatErrAccountQuota => 'Naubos na ang quota ng account';

  @override
  String get chatErrRateLimit => 'Masyadong maraming request. Subukang muli mamaya.';

  @override
  String get chatErrContextLength => 'Masyadong mahaba ang chat. Ipadala ang /compact, saka subukang muli.';

  @override
  String get chatErrModelUnavailable => 'Pansamantalang hindi available ang serbisyo ng model';

  @override
  String get chatErrModelTimeout => 'Nag-time out ang tugon ng model';

  @override
  String get chatErrModelConnection => 'Hindi maabot ang serbisyo ng model';

  @override
  String get chatErrModelEmpty => 'Walang ibinalik na nilalaman ang model';

  @override
  String get chatErrEngineOutdated => 'Kailangan ng mas bagong engine ang model na ito';

  @override
  String get chatErrModelUnsupported => 'Hindi available ang model na ito';

  @override
  String get chatSwitchModel => 'Palitan ang model';

  @override
  String get chatErrTurn => 'Nagkaproblema sa turn na ito';

  @override
  String chatTurnSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hakbang', one: '1 hakbang');
    return '$_temp0';
  }

  @override
  String chatTurnFootnoteSemantics(String summary) {
    return 'Turn na ito: $summary, tingnan ang trajectory ng turn';
  }

  @override
  String chatTurnToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count tool call', one: '1 tool call');
    return '$_temp0';
  }

  @override
  String chatTurnMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count mensahe', one: '1 mensahe');
    return '$_temp0';
  }

  @override
  String chatTurnThoughts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thinking block',
      one: '1 thinking block',
    );
    return '$_temp0';
  }

  @override
  String get chatMe => 'Ako';

  @override
  String chatGoalSemantics(String objective) {
    return 'Layunin, $objective';
  }

  @override
  String chatGoalStateSemantics(String objective, String state) {
    return 'Layunin, $objective, $state';
  }

  @override
  String chatTodoItemSemantics(String content, String state) {
    return '$content, $state';
  }

  @override
  String chatMentionSemantics(String kind, String label) {
    return '$kind: $label';
  }

  @override
  String chatArtifactSemantics(String name, String description) {
    return '$name, $description';
  }

  @override
  String get commonCancel => 'Kanselahin';

  @override
  String get commonRetry => 'Subukang muli';

  @override
  String get commonClose => 'Isara';

  @override
  String get commonCopied => 'Nakopya';

  @override
  String get commonSave => 'I-save';

  @override
  String get commonSettings => 'Settings';

  @override
  String get commonBack => 'Bumalik';

  @override
  String get commonCopy => 'Kopyahin';

  @override
  String get commonDone => 'Tapos na';

  @override
  String get commonDelete => 'Burahin';

  @override
  String get commonInstall => 'I-install';

  @override
  String get commonShare => 'Ibahagi';

  @override
  String get commonAdd => 'Magdagdag';

  @override
  String get commonEdit => 'I-edit';

  @override
  String get commonClear => 'I-clear';

  @override
  String get commonCollapse => 'Ipakita ang mas kaunti';

  @override
  String get commonEnable => 'I-enable';

  @override
  String get commonOpen => 'Buksan';

  @override
  String get commonDetails => 'Mga detalye';

  @override
  String get commonMore => 'Higit pa';

  @override
  String get commonCreate => 'Lumikha';

  @override
  String get commonSend => 'Ipadala';

  @override
  String get commonStop => 'Ihinto';

  @override
  String get commonPaste => 'I-paste';

  @override
  String get commonHide => 'Itago';

  @override
  String get commonLater => 'Mamaya';

  @override
  String get commonConfirm => 'Kumpirmahin';

  @override
  String get commonRename => 'Palitan ang pangalan';

  @override
  String get commonContinue => 'Magpatuloy';

  @override
  String get commonNotSet => 'Hindi nakatakda';

  @override
  String get commonDefault => 'Default';

  @override
  String get commonSaved => 'Na-save';

  @override
  String get commonSaveFailed => 'Hindi na-save';

  @override
  String get commonSaveFailedRetry => 'Hindi na-save. Subukang muli.';

  @override
  String get commonFailedTryAgain => 'Nagkaproblema. Subukang muli.';

  @override
  String get commonEngineUnreachable => 'Hindi maabot ang engine';

  @override
  String get commonStorageFull => 'Kulang ang storage';

  @override
  String get commonConnectionFailed => 'Hindi makakonekta';

  @override
  String get commonCopyLink => 'Kopyahin ang link';

  @override
  String get commonOpenWith => 'Buksan sa ibang app';

  @override
  String get commonOpenInWeb => 'Buksan sa JDK Web';

  @override
  String get commonUntitledChat => 'Chat na walang pamagat';

  @override
  String get commonNewChat => 'Bagong chat';

  @override
  String get commonYesterday => 'Kahapon';

  @override
  String get commonSignedIn => 'Naka-sign in';

  @override
  String get commonSignIn => 'Mag-sign in';

  @override
  String get commonSignOut => 'Mag-sign out';

  @override
  String get commonThisPhone => 'Ang telepono na ito';

  @override
  String get commonRemoteHost => 'Remote host';

  @override
  String get commonWeb => 'Web';

  @override
  String get commonFollowSystem => 'System';

  @override
  String get commonLight => 'Light';

  @override
  String get commonDark => 'Dark';

  @override
  String get commonInProgress => 'Isinasagawa';

  @override
  String get commonCompleted => 'Tapos na';

  @override
  String get commonStopped => 'Huminto';

  @override
  String get commonCancelled => 'Nakansela';

  @override
  String get commonRunning => 'Tumatakbo';

  @override
  String get commonPaused => 'Naka-pause';

  @override
  String get commonDeclined => 'Tinanggihan';

  @override
  String get commonFailed => 'Nabigo';

  @override
  String get commonStopping => 'Humihinto';

  @override
  String get commonWaitingApproval => 'Kailangan ng pag-apruba';

  @override
  String get commonWaitingAnswer => 'Kailangan ang iyong sagot';

  @override
  String get commonNotConnected => 'Hindi nakakonekta';

  @override
  String get commonInstalled => 'Naka-install';

  @override
  String get commonName => 'Pangalan';

  @override
  String get commonStatus => 'Katayuan';

  @override
  String get commonVersion => 'Bersyon';

  @override
  String get commonOther => 'Iba pa';

  @override
  String get commonPin => 'I-pin';

  @override
  String get commonReply => 'Sumagot';

  @override
  String get commonUpdate => 'I-update';

  @override
  String get commonViewLogs => 'Tingnan ang mga log';

  @override
  String commonItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count item', one: '1 item');
    return '$_temp0';
  }

  @override
  String commonMonthDay(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String get companionTitle => 'Companion room';

  @override
  String get companionEntrySubtitle => 'Makasama siya sandali';

  @override
  String get companionDefaultName => 'siya';

  @override
  String companionInputHint(String name) {
    return 'Magsabi ng kahit ano kay $name';
  }

  @override
  String get companionMenu => 'Higit pa';

  @override
  String get companionVoice => 'Boses';

  @override
  String get companionStop => 'Hilingin sa kanyang tumigil';

  @override
  String get companionSend => 'Ipadala';

  @override
  String get companionNotConnected => 'Hindi ko maabot ang engine ngayon. Sabihin mo ulit mamaya?';

  @override
  String get companionSendFailed => 'Hindi umabot iyon. Sabihin mo ulit?';

  @override
  String get companionLogTitle => 'Log';

  @override
  String get companionContextUnsupported =>
      'Hindi pa matatanggap ng host na ito ang kanyang context: hindi aabot sa kanya ang kanyang pangalan, persona at ang kakahapon lang, ang sinasabi mo lang. I-update ang host o lumipat sa light mode.';

  @override
  String get companionLogEmpty => 'Wala pang nasasabi.';

  @override
  String get companionLogYou => 'Ikaw';

  @override
  String get companionLogOpenChat => 'Buksan sa chat';

  @override
  String get companionLogOlder => 'I-load ang mga naunang mensahe';

  @override
  String get companionMenuHistory => 'Tingnan ang kasaysayan ng chat';

  @override
  String get companionMenuRestart => 'Magsimulang muli';

  @override
  String get companionMenuRestartHint => 'Magsimula ng bagong usapan';

  @override
  String get companionMenuRestartConfirm =>
      'Malilimutan niya ang usapang ito. Mananatili sa host ang lumang talaan at hindi ito buburahin.';

  @override
  String get companionMenuRemovePack => 'Alisin ang mga asset';

  @override
  String get companionMenuRemoveConfirm =>
      'Buburahin ang mga asset ng karakter sa telepono na ito. Hindi apektado ang mga chat. Kakailanganin mong i-import muli ang mga ito sa susunod.';

  @override
  String companionCreditAuthor(String name) {
    return 'Ni $name';
  }

  @override
  String get companionSetupTitle => 'Iuwi siya';

  @override
  String get companionSetupBody =>
      'Hindi bahagi ng app ang mga asset ng karakter at napupunta lang sa telepono mo kapag gusto mo. Mag-import ng asset pack (zip) para makilala siya.';

  @override
  String get companionSetupImport => 'I-import ang asset pack';

  @override
  String get companionFailedTitle => 'Hindi siya nakalabas';

  @override
  String companionFailedBody(String reason) {
    return 'Nabigo ang pag-load sa telepono na ito ($reason). Maaari mong i-import muli ang asset pack at subukang muli.';
  }

  @override
  String get companionPackBroken =>
      'Hindi mabuksan ang file na ito. Maaaring hindi ito asset pack, o maaaring sira ito.';

  @override
  String get companionPackRuntimeMismatch => 'Hindi tugma ang runtime sa pack na ito sa bersyong ito ng app.';

  @override
  String get companionPackNoRuntime =>
      'Karakter lang ang nasa pack na ito at wala pang runtime sa telepono na ito. Mag-import muna ng buong asset pack.';

  @override
  String get companionPackNoModel =>
      'Walang nahanap na Live2D model (.model3.json) sa pack. I-zip ang buong folder ng model at subukang muli.';

  @override
  String get companionPackUnsafe => 'May mga file o path ang pack na hindi pinapayagan, kaya hindi ito na-import.';

  @override
  String get companionPackTooLarge => 'Masyadong malaki ang asset pack na ito.';

  @override
  String get companionPackStorage => 'Hindi maisulat ang mga file. Suriin ang libreng storage ng telepono mo.';

  @override
  String companionGreetFirst(String name) {
    return 'Hi, ako si $name. Dito na ako nakatira, ikinagagalak kitang makilala.';
  }

  @override
  String get companionGreetMorning => 'Magandang umaga! Huwag kalimutang mag-almusal ngayon.';

  @override
  String get companionGreetNoon => 'Tanghali na pala. Kumain ka na ba?';

  @override
  String get companionGreetAfternoon => 'Magandang hapon. Nagdi-daydream lang ako.';

  @override
  String get companionGreetEvening => 'Magandang gabi. Kumusta ang araw mo?';

  @override
  String get companionGreetLate => 'Gising ka pa rin ng ganito kagabi na?';

  @override
  String get companionGreetLong => 'Ang tagal na! Akala ko nakalimutan mo na ako.';

  @override
  String get companionGreetBack => 'Hm? Bumalik ka na naman.';

  @override
  String get companionWake => 'Mm... hindi ako natutulog. Nagpapahinga lang ang mga mata ko.';

  @override
  String get companionPat1 => 'Hehe... puwede ka pang magpatuloy nang kaunti pa.';

  @override
  String get companionPat2 => 'Mmm, ang sarap.';

  @override
  String get companionPat3 => 'Ginugulo mo ang buhok ko.';

  @override
  String get companionTapHead1 => 'Ano\'ng meron?';

  @override
  String get companionTapHead2 => 'Hm?';

  @override
  String get companionTapFace1 => 'Huwag mong tusukin ang mukha ko.';

  @override
  String get companionTapFace2 => 'Wow, ang lamig ng mga kamay mo.';

  @override
  String get companionTapFace3 => 'May dumi ba sa mukha ko?';

  @override
  String get companionTapBody1 => 'Oh! Ginulat mo ako.';

  @override
  String get companionTapBody2 => 'Ano iyon?';

  @override
  String get companionTapBody3 => 'Kalalaba ko lang ng apron na ito!';

  @override
  String get companionTapTail1 => 'Hindi para hawakan ang buntot!';

  @override
  String get companionTapTail2 => 'Ay, nakakakiliti.';

  @override
  String get companionTapTail3 => 'Napakahalagang buntot ito.';

  @override
  String get companionTapLegs1 => 'May nasa sahig ba?';

  @override
  String get companionTapLegs2 => 'Saan ka nakatingin?';

  @override
  String get companionTease1 => 'Tigilan mo na, nahihilo na ako.';

  @override
  String get companionTease2 => 'Isa pang tusok at hindi na kita papansinin!';

  @override
  String get companionTease3 => 'Wala ka bang mas magandang gawin?';

  @override
  String get companionStatusIdle => 'Nagdi-daydream';

  @override
  String get companionStatusListening => 'Nakikinig';

  @override
  String get companionStatusThinking => 'Nag-iisip';

  @override
  String get companionStatusSpeaking => 'Nagsasalita';

  @override
  String get companionStatusSleeping => 'Natutulog';

  @override
  String get companionStatusAway => 'Wala';

  @override
  String get companionListening => 'Nakikinig…';

  @override
  String get companionTouchHint => 'Subukang haplusin ang ulo niya';

  @override
  String get companionArriving => 'Lumalangoy siya papunta rito…';

  @override
  String get companionPrivacyLine =>
      'Nananatili sa telepono na ito ang mga asset. Dumadaan sa kasalukuyang host ang mga chat.';

  @override
  String get companionMemoryTitle => 'Ang naaalala niya';

  @override
  String companionMemoryScope(String host) {
    return 'Nakatago sa $host. Hindi pa niya ito kusang binabanggit; gagawin iyon ng susunod na bersyon.';
  }

  @override
  String get companionMemoryAdd => 'Magdagdag';

  @override
  String get companionMemoryEdit => 'I-edit';

  @override
  String get companionMemorySave => 'I-save';

  @override
  String get companionMemoryHint => 'Halimbawa: Mahilig ako sa tsaang walang asukal at hindi ako umiinom ng kape';

  @override
  String get companionMemoryForget => 'Kalimutan';

  @override
  String get companionMemoryForgetTitle => 'Ipakalimot ito sa kanya?';

  @override
  String get companionMemoryEmpty => 'Wala pang naka-save';

  @override
  String get companionMemoryEmptyHint =>
      'Isulat kung ano ang gusto mong tandaan niya. Nananatili ito sa kasalukuyang host, at maaari mo itong i-edit o burahin anumang oras.';

  @override
  String get companionMemoryUnsupported => 'Hindi pa maitatago ng host na ito ang kanyang mga alaala';

  @override
  String get companionMemoryUnsupportedHint =>
      'Hindi ito available sa JDK Remote relay, o mas luma ang dsh-go bridge ng host na ito.';

  @override
  String get companionMemoryLoadFailed => 'Hindi ma-load';

  @override
  String get companionMemoryRetry => 'Subukang muli';

  @override
  String get companionMemoryConflict => 'Kababago lang nito sa ibang lugar, kaya na-refresh';

  @override
  String get companionMemoryFull => 'Puno na ang listahan. Magbura muna ng ilan';

  @override
  String get companionMemorySaveFailed => 'Hindi na-save. Subukang muli?';

  @override
  String get companionStatusSnacking => 'Nagme-merienda';

  @override
  String get companionStatusPlaying => 'Naglalaro sa bubble';

  @override
  String get companionStatusResting => 'Nagpapahinga sa cushion';

  @override
  String get companionSnack1 => 'Nom! Ang sarap!';

  @override
  String get companionSnack2 => 'Lasang seaweed. Salamat.';

  @override
  String get companionSnack3 => 'Mm... puwede bang isa pa?';

  @override
  String get companionPlay1 => 'Hoy, nakuha ko!';

  @override
  String get companionPlay2 => 'Ang lambot ng bubble. Nakakatuwa!';

  @override
  String get companionPlay3 => 'Lumutang itong muli pabalik.';

  @override
  String get companionRest1 => 'Sasandal muna ako rito, kung gayon.';

  @override
  String get companionRest2 => 'Sige, nakikinig ako.';

  @override
  String get companionTouchHintHome =>
      'I-tap ang shell, ang bubble at ang cushion, o i-drag ang meryenda sa bibig niya';

  @override
  String get companionMenuMode => 'Paano siya magsalita';

  @override
  String get companionModeLight => 'Magaan';

  @override
  String get companionModeLightHint => 'Chat lang. Ang telepono ang kumakausap sa model; walang engine';

  @override
  String get companionModeFull => 'Buo';

  @override
  String get companionModeFullHint => 'JDK sa host, na may mga tool at phone control';

  @override
  String get companionLightNoKey =>
      'Kailangan ng DeepSeek API key ang Light mode. Magdagdag ng isa sa Settings at makakapag-usap tayo.';

  @override
  String get companionLightBadKey => 'Mukhang mali ang API key, o hindi na ito wasto.';

  @override
  String get companionLightBusy => 'Abala roon. Sabihin mo ulit mamaya?';

  @override
  String get companionNotConnectedTryLight =>
      'Hindi ko maabot ang host ngayon. Kung gusto mo lang makipag-chat, lumipat sa Light sa menu sa kanang itaas.';

  @override
  String get companionMenuRestartLightHint => 'I-clear ang chat sa telepono na ito';

  @override
  String get companionMenuRestartLightConfirm =>
      'Malilimutan niya ang usapang ito, at mabubura ang chat sa telepono na ito.';

  @override
  String get companionInviteRest => 'Magpahinga muna tayo sa cushion?';

  @override
  String get companionInviteAccept => 'Sige';

  @override
  String get companionInviteDecline => 'Hindi ngayon';

  @override
  String get companionInviteYes1 => 'Hehe, sandali lang.';

  @override
  String get companionInviteYes2 => 'Magpapakomportable ako. Magpahinga ka rin.';

  @override
  String get companionMenuPace => 'Gaano siya kadalas magsalita';

  @override
  String get companionPaceHint =>
      'Nagsasalita lang siya habang tahimik kang nakaupo kasama niya: iniimbitahan kang magpahinga nang magkasama, o binabanggit ang isa pang usapan. Hindi kailanman sa hatinggabi, at hindi hihigit sa isang imbitasyon bawat pagbisita.';

  @override
  String get companionPaceQuiet => 'Tahimik';

  @override
  String get companionPaceQuietHint => 'Hindi kailanman nang walang tanong; nagsasalita siya kapag kinakausap mo siya';

  @override
  String get companionPaceRare => 'Paminsan-minsan';

  @override
  String get companionPaceRareHint => 'Hanggang 2 beses sa isang araw, hindi bababa sa 6 na oras ang pagitan';

  @override
  String get companionPaceOften => 'Madalas';

  @override
  String get companionPaceOftenHint => 'Hanggang 6 na beses sa isang araw, hindi bababa sa 2 oras ang pagitan';

  @override
  String get companionPaceChatty => 'Madaldal';

  @override
  String get companionPaceChattyHint => 'Hanggang 12 beses sa isang araw, hindi bababa sa kalahating oras ang pagitan';

  @override
  String get companionSetupBundled => 'Iuwi siya';

  @override
  String get companionSetupBodyBundled =>
      'Kasama siya ng app: isang tap at narito na siya, binubuksan lang sa telepono na ito. Maaari ka ring mag-import ng ibang asset pack, o mag-zip ng folder ng Live2D model at i-import iyon.';

  @override
  String get companionSetupImportOther => 'Mag-import ng ibang pack';

  @override
  String get companionMenuRemoveConfirmBundled =>
      'Buburahin ang mga asset ng karakter na na-unpack sa telepono na ito. Hindi apektado ang mga chat. Maaari mo siyang ibalik anumang oras.';

  @override
  String get companionHug1 => 'Mm... isang yakap.';

  @override
  String get companionHug2 => 'Ligtas ang pakiramdam ko nang ganito.';

  @override
  String get companionHug3 => 'Kaunti pa, kaunti lang.';

  @override
  String get companionBondTitle => 'Kayong dalawa';

  @override
  String get companionBond0 => 'Kakakilala pa lang';

  @override
  String get companionBond1 => 'Nagkikilala pa';

  @override
  String get companionBond2 => 'Malapit';

  @override
  String get companionBond3 => 'Napakalapit';

  @override
  String get companionCloser1 => 'Sa tingin ko... hindi na ako gaanong kinakabahan.';

  @override
  String get companionCloser2 => 'Gumagaan ang pakiramdam kapag kasama ka.';

  @override
  String get companionCloser3 => 'Patuloy kang bumalik, ha? Mami-miss kita.';

  @override
  String get companionPatClose => 'Gustong-gusto ko kapag hinahaplos mo ang ulo ko.';

  @override
  String get companionHugClose => 'Puwede mo akong yakapin nang mas mahigpit, alam mo.';

  @override
  String get companionTaskDoneUntitled => 'Tapos na ang gawain mo roon.';

  @override
  String get companionTaskFailedUntitled => 'Mukhang nagka-error ang gawain mo roon. Tingnan mo?';

  @override
  String get companionTaskOpen => 'Tingnan';

  @override
  String get companionMenuSignals => 'Ang ibinabanggit niya';

  @override
  String get companionSignalsHint =>
      'Sinasabi lang ito sa iyo, dito sa kanyang kuwarto; walang napupunta sa model. Sumusunod ang dalas sa Gaano siya kadalas magsalita, ibinabahagi sa mga imbitasyon, at hindi kailanman sa hatinggabi. Sa Tahimik, wala siyang sinasabi.';

  @override
  String get companionSignalState => 'Subaybayan ang ibang usapan';

  @override
  String get companionSignalStateHint => 'Napapansin niya kapag natapos o nabigo ang isa pang usapan sa host na ito';

  @override
  String get companionSignalSpeech => 'Banggitin ito';

  @override
  String get companionSignalSpeechHint => 'Nagsasabi siya ng maikling linya habang tahimik ka';

  @override
  String get companionSignalVoice => 'Sabihin nang malakas';

  @override
  String get companionSignalVoiceHint => 'Binabasa nang malakas ang linya kapag naka-on ang kanyang boses';

  @override
  String get companionSignalNight => 'Paalala sa hatinggabi na magpahinga';

  @override
  String get companionSignalNightHint =>
      'Pagkaraan ng ilang sandali sa kanyang kuwarto sa hatinggabi, banayad ka niyang paaalalahanan nang isang beses';

  @override
  String get companionSignalLateUse => 'Gabi na at narito ka pa rin sa akin... magpahinga ka kaya nang kaunti?';

  @override
  String get companionRecallTitle => 'Alalahanin ang mga bagay sa full mode';

  @override
  String get companionRecallHint =>
      'Kapag in-on, magsisimula ng bagong usapan; ino-off ito kapag binago ang naaalala niya';

  @override
  String get companionRecallConfirm =>
      'Kapag naka-on, ang kanyang mga kumpirmadong alaala (hanggang 12) ay mapupunta sa model kasama ng bawat sagot niya sa full mode. Magsisimula ng bagong usapan; mananatili ang kasalukuyan sa pangunahing listahan ng chat. Ino-off ito kapag binago ang kanyang mga alaala, at maaari mo itong i-on muli.';

  @override
  String get companionRecallTurnOn => 'I-on';

  @override
  String get companionRecallOn => 'Mula sa bagong usapang ito, tatandaan ko ang hiniling mong tandaan ko.';

  @override
  String get companionRecallBusy => 'May isa pang usapang gumagamit na ng awtomatikong recall. I-off muna ito roon.';

  @override
  String get companionRecallUnsupported => 'Hindi maia-on ng host na ito ang awtomatikong recall ngayon';

  @override
  String get companionRecallFailed => 'Hindi naka-on ang awtomatikong recall. Subukang muli.';

  @override
  String get companionRecallOff =>
      'Naka-off ang awtomatikong recall. Magsisimula ng bagong usapan ang susunod mong mensahe.';

  @override
  String get companionRecallOffFailed => 'Hindi naka-off ang awtomatikong recall. Subukang muli.';

  @override
  String get companionRecallStopped =>
      'Huminto ang awtomatikong recall (nagbago ang naaalala niya), kaya nagsimula ang bagong usapan. Maaari mo itong i-on muli mula sa menu.';

  @override
  String get companionMenuVoice => 'Ang kanyang boses';

  @override
  String get companionMenuVoiceHint =>
      'Binabasa nang malakas ang kanyang mga salita gamit ang sariling boses ng telepono';

  @override
  String get companionVoiceHello => 'Hi, ito ang boses ko. Iwanang naka-on kung gusto mo.';

  @override
  String get companionVoiceUnavailable =>
      'Walang Chinese na boses ang telepono na ito. Maaari kang magdagdag ng isa sa Text-to-speech sa system settings.';

  @override
  String get companionWidgetWaiting => 'Naghihintay sa iyo sa kuwarto';

  @override
  String get companionVoiceOn => 'Hayaan siyang magsalita';

  @override
  String get companionVoiceOffHint => 'Kapag in-on mo ito, magsasabi muna siya ng hello sa napiling boses.';

  @override
  String get companionVoiceOff => 'Naka-off';

  @override
  String get companionVoiceSource => 'Boses';

  @override
  String get companionVoiceSystem => 'Sariling boses ng telepono';

  @override
  String get companionVoiceSystemHint => 'System text-to-speech, gumagana offline';

  @override
  String get companionVoiceOpenai => 'OpenAI-compatible API';

  @override
  String get companionVoiceOpenaiHint =>
      'OpenAI, SiliconFlow, at karamihan ng self-hosted na GPT-SoVITS, CosyVoice o edge-tts server';

  @override
  String get companionVoiceCustom => 'Custom HTTP';

  @override
  String get companionVoiceCustomHint => 'Anupamang iba: ilarawan ang request at ang tugon';

  @override
  String get companionVoiceApi => 'API';

  @override
  String get companionVoiceBase => 'Address';

  @override
  String get companionVoiceBaseHelper => 'Hanggang /v1; idinadagdag ng app ang /audio/speech';

  @override
  String get companionVoiceKeyHelper => 'Itinatago sa secure storage ng telepono na ito';

  @override
  String get companionVoiceModel => 'Model';

  @override
  String get companionVoiceVoice => 'Boses';

  @override
  String get companionVoiceVoiceHelper =>
      'Ang pangalan ng boses ng serbisyo, tulad ng alloy, o isang speaker sa sarili mong server';

  @override
  String get companionVoiceRequest => 'Request';

  @override
  String get companionVoiceUrl => 'Request URL';

  @override
  String get companionVoiceUrlHelper => 'Gumagana rin ang {text} sa URL';

  @override
  String get companionVoiceMethod => 'Method';

  @override
  String get companionVoiceHeaders => 'Mga header';

  @override
  String get companionVoiceHeadersHelper => 'Isa bawat linya; itinatago sa secure storage';

  @override
  String get companionVoiceBody => 'Body';

  @override
  String get companionVoiceBodyHelper => 'Nagiging sinasabi niya ang {text}';

  @override
  String get companionVoiceField => 'Audio field';

  @override
  String get companionVoiceFieldHelper =>
      'Kung JSON ang tugon: kung nasaan ang audio (base64 o link), tulad ng data.audio. Iwanang walang laman kapag audio ang ibinabalik';

  @override
  String get companionVoicePrivacy => 'Ipinapadala sa serbisyong inilagay mo ang sinasabi niya.';

  @override
  String get companionVoicePreview => 'Preview';

  @override
  String get companionVoicePreviewing => 'Humihiling…';

  @override
  String get companionVoicePreviewOk => 'Gumagana. Narinig mo ba siya?';

  @override
  String companionVoicePreviewFailed(String reason) {
    return 'Hindi gumana: $reason';
  }

  @override
  String get companionVoiceNotSetUp => 'Punan muna ang address sa itaas.';

  @override
  String get companionVoiceFallback =>
      'Hindi maabot ang serbisyo ng kanyang boses, kaya ang sariling boses ng telepono ang pumalit';

  @override
  String get companionGreetFirstNameless => 'Hi, dito na ako nakatira. Ikinagagalak kitang makilala.';

  @override
  String companionRenamed(String name) {
    return '\"$name\"... sige, iyan na ang pangalan ko mula ngayon.';
  }

  @override
  String get companionVoicePreset => 'Mga sikat na serbisyo';

  @override
  String get companionVoicePresetHint =>
      'Xiaomi MiMo, OpenAI, SiliconFlow, Alibaba Model Studio: magdagdag lang ng key';

  @override
  String get companionVoiceService => 'Serbisyo';

  @override
  String companionVoiceKeyWhere(String site) {
    return 'Kumuha ng isa sa $site; itinatago sa secure storage ng telepono na ito';
  }

  @override
  String get companionVoiceVoiceCustomHelper => 'Pumili ng isa, o mag-type ng voice ID na ibinigay ng serbisyo';

  @override
  String get companionVoiceStyle => 'Istilo ng pagsasalita';

  @override
  String get companionVoiceStyleHelper =>
      'Ilarawan ang kanyang tono at babasahin ito ng serbisyo nang ganoon; iwanang walang laman para sa default na banayad na boses ng babae';

  @override
  String get companionVoiceFemale => 'babae';

  @override
  String get companionVoiceMale => 'lalaki';

  @override
  String get companionClonePreset => 'Mga preset na boses';

  @override
  String get companionCloneMine => 'Mag-clone ng boses';

  @override
  String get companionVoicePresetVoice => 'Preset na boses';

  @override
  String get companionCloneRecording => 'Recording';

  @override
  String get companionCloneHelper =>
      '5–30 segundo ng isang taong nagsasalita nang walang ingay sa background, mp3 o wav, hanggang 7 MB. Gamitin lang ang sarili mong boses, o boses na pumayag ang may-ari. Bawat linyang sasabihin niya ay nagpapadala ng recording na ito sa Xiaomi.';

  @override
  String get companionCloneNone => 'Wala pang recording';

  @override
  String companionCloneReady(String detail) {
    return 'Na-upload · $detail';
  }

  @override
  String companionCloneSeconds(int n) {
    return '$n s';
  }

  @override
  String get companionClonePick => 'Pumili ng recording';

  @override
  String get companionCloneReplace => 'Palitan';

  @override
  String get companionCloneTooLarge =>
      'Masyadong malaki ang recording (7 MB ang pinakamataas). Paikliin ito at subukang muli.';

  @override
  String get companionCloneNotAudio => 'Mp3 o wav na recording lang ang gumagana.';

  @override
  String get companionCloneFailed => 'Hindi mabasa ang recording na iyon.';

  @override
  String get companionMenuPersona => 'Tungkol sa kanya';

  @override
  String get companionPersonaName => 'Pangalan';

  @override
  String get companionPersonaNameHelper => 'Iwanang walang laman para sa pangalan ng pack';

  @override
  String get companionPersonaCallMe => 'Ang itinatawag niya sa iyo';

  @override
  String get companionPersonaCallMeHint => 'hal. Sam';

  @override
  String get companionPersonaCallMeHelper => 'Iwanang walang laman kung walang partikular';

  @override
  String get companionPersonaText => 'Persona';

  @override
  String get companionPersonaTextLabel => 'Kung sino siya at paano siya magsalita';

  @override
  String get companionPersonaTextHelper =>
      'Ang kanyang personalidad, kung sino siya, paano siya magsalita, ano ang hindi niya sasabihin: ikaw ang magsusulat o magbubura ng lahat. Ang format lang ng kanyang mga marka ng ekspresyon ang idinadagdag ng app.';

  @override
  String get companionPersonaReset => 'I-reset';

  @override
  String get companionPersonaFooter =>
      'Gagamitin ito ng Light mode mula sa susunod niyang sagot; sasabihin ito sa kanya ng full mode sa susunod mong mensahe.';

  @override
  String get companionMenuMoves => 'Mga galaw at mukha';

  @override
  String get companionMovesHint =>
      'Kasama ang mga ito sa model. Ang mga naka-on ay iniaalok sa AI (hanggang 24 na ekspresyon at 24 na galaw, ayon sa pagkakasunod sa listahan) at ginagamit niya ang mga ito sa kanyang mga sagot; i-tap ang pangalan para bigyan ito ng mas malinaw na pangalan, i-tap ang ▶ para subukan ito sa kanya.';

  @override
  String get companionMovesNone =>
      'Walang sariling ekspresyon o galaw ang model na ito; ginagamit niya ang kanyang mga built-in.';

  @override
  String get companionMovesRename => 'Palitan ang pangalan';

  @override
  String get companionMovesTry => 'Subukan';

  @override
  String get companionPackLegacyModel =>
      'Ito ay lumang Cubism 2 model (.moc at model.json); .moc3 lang mula Cubism 3 pataas ang binabasa ng runtime sa telepono. Buksan ito sa Cubism Editor, i-export bilang moc3 at i-import iyon.';

  @override
  String companionFailedMocVersion(String version, String latest) {
    return 'Na-export ang model na ito ng mas bagong Cubism (moc version $version); binabasa ng runtime sa telepono hanggang $latest. I-export ito para sa mas lumang bersyon sa Cubism Editor at i-import iyon.';
  }

  @override
  String get companionMenuAdapt => 'I-fit ang model na ito';

  @override
  String get companionAdaptHint =>
      'Binabasa ng sarili mong model (ang key mo, sinisingil bawat request) ang karakter na ito at itinutugma ang kanyang ulo, mata, ekspresyon at kung saan siya mahahawakan. Ipinapadala: ang pangalan ng model, ang listahan ng parameter nito, ang mga pangalan ng mga ekspresyon, galaw at bahagi nito, ang isinusulat mo sa ibaba at ang kasalukuyang fitting. Hindi kailanman ang mga file o texture ng model.';

  @override
  String get companionAdaptOffer =>
      'Kailangang i-fit ang model na ito: binabasa ng sarili mong model ang listahan ng parameter nito at ang mga pangalan ng mga ekspresyon at galaw (hindi kailanman ang mga file ng model), gamit ang key mo nang isang beses. Awtomatikong ifi-fit ang mga bagong model pagkatapos nito; maaari mo itong i-off sa menu.';

  @override
  String get companionAdaptOfferYes => 'I-fit ito';

  @override
  String get companionAdaptOfferNo => 'Hindi ngayon';

  @override
  String get companionAdaptNote => 'Ano ang mali? (opsyonal)';

  @override
  String get companionAdaptNoteHint =>
      'Halimbawa: walang nangyayari kapag hinahaplos ang ulo niya, dumidilim ang mukha niya kapag masaya siya';

  @override
  String get companionAdaptRun => 'Ipa-fit sa AI';

  @override
  String get companionAdaptUndo => 'I-undo ang fitting';

  @override
  String get companionAdaptAuto => 'I-fit ang mga bagong model kapag na-import';

  @override
  String get companionAdaptStart => 'Hayaan mo akong masanay sa bagong katawan na ito…';

  @override
  String get companionAdaptDone => 'Ayan, nakuha ko na ang katawan na ito.';

  @override
  String companionAdaptDoneNote(String note) {
    return 'Ayan, nakuha ko na ang katawan na ito. $note';
  }

  @override
  String get companionAdaptUndone => 'OK, balik na ako sa dati.';

  @override
  String get companionAdaptNoKey => 'Para i-fit ako gamit ang model mo, magdagdag muna ng API key sa Settings.';

  @override
  String companionAdaptFailed(String reason) {
    return 'Hindi gumana iyon ($reason). Maaari mong subukang muli mula sa I-fit ang model na ito sa menu.';
  }

  @override
  String get companionAdaptUnreadable => 'walang saysay ang sagot ng model';

  @override
  String get companionAdaptEmpty => 'walang nahanap na itutugma ang model';

  @override
  String get companionAdaptNetwork => 'walang koneksyon';

  @override
  String get systemImeTitle => 'Diagnostics ng system input method';

  @override
  String get systemImeCollect => 'Kunin ang mga kamakailang event';

  @override
  String get systemImePrivacy =>
      'Mag-reproduce muna. Bawat pagtatangka ay nangangailangan ng native na kumpirmasyon: mga nakapirming event mula sa huling 120 segundo, hanggang 64; walang laman ng input o raw log. Hindi kailanman awtomatikong humihingi ng pahintulot.';

  @override
  String get systemImeEvidenceLimits =>
      'Hindi nagpapatunay ng pagiging nakikita ng keyboard ang mga kahilingang show/hide. Hindi nangangahulugang normal ang kilos ng system kung walang laman o nabigo ang pagkuha.';

  @override
  String get systemImeNotCollected => 'Hindi nakolekta';

  @override
  String get systemImeCollecting => 'Naghihintay ng pahintulot o resulta ng pagtatangkang ito';

  @override
  String get systemImeRetained => 'Napanatili ang ebidensya';

  @override
  String get systemImeNoEvents => 'Walang nahanap na tumutugmang event';

  @override
  String get systemImeUnavailable => 'Walang napiling, live na privileged channel';

  @override
  String get systemImeUnsupported => 'Hindi sinusuportahan ng bersyon o channel na ito ang pagkuha';

  @override
  String get systemImeDenied => 'Hindi inaprubahan ang pagtatangkang ito';

  @override
  String get systemImeCancelled => 'Kinansela ang pagtatangkang ito';

  @override
  String get systemImeBusy => 'Abala ang channel; subukang muli mamaya';

  @override
  String get systemImeTimeout => 'Nag-time out ang pagkuha; subukang muli';

  @override
  String get systemImeLimitExceeded => 'Lumampas sa limitasyon ng pagkuha; walang napanatiling event';

  @override
  String get systemImeFailed => 'Nabigo ang pagkuha o di-wasto ang tugon';

  @override
  String get systemImeEventCount => 'Mga napanatiling event';

  @override
  String get systemImeCapturedAt => 'Kinuha noong';

  @override
  String get systemImePermissions => 'Mga pahintulot ng phone-control (opsyonal)';

  @override
  String get systemImePermissionsHint =>
      'Mag-configure lang ng privileged channel kung nais mo; hindi ito kailangan para sa diagnostics. Hindi pahintulot para sa pagkuhang ito ang mga umiiral na pahintulot sa telepono.';

  @override
  String get systemImeClear => 'I-clear ang ebidensya at kanselahin ang pagkuha';

  @override
  String get systemImeMemory =>
      'Nasa memorya lang; nawawala pagkatapos ng restart. Pinapalitan ng bagong pagkuha ang lumang ebidensya. Kasama lang sa manual na AI diagnostics o ZIP export. Hindi binabawi ng pag-clear ang mga snapshot o file na na-export na.';

  @override
  String get engineNewChatDefaultsLast => 'Mga default ng bagong chat (huling pinili)';

  @override
  String get engineNewChatDefaultsFixed => 'Mga default ng bagong chat (nakapirmi)';

  @override
  String get engineNewChatUseLast => 'Huling pinili';

  @override
  String get engineNewChatUseFixed => 'Nakapirming default';

  @override
  String get engineNewChatDefaultsHint =>
      'Naka-save sa kasalukuyang host; nakakaapekto lang sa model at thinking effort ng mga bagong chat. May hiwalay na default ang mga pahintulot at hindi kailanman nagmamana ng pansamantalang pahintulot ng session.';

  @override
  String get engineNewChatDefaultsLegacy =>
      'Pag-alala lang sa huling pinili ang sinusuportahan ng engine na ito, hindi ang mga nakapirming default. Hindi nito makumpirma kung na-save ang mga default kapag lumilipat ng model.';

  @override
  String get engineNewChatDefaultsUnsupported => 'Walang mae-edit na setting ng default na model ang host na ito';

  @override
  String get engineNewChatDefaultsSelectionUnavailable =>
      'Hindi na available ang model o thinking effort na ito. Pumili muli.';

  @override
  String get engineNewChatDefaultsInheritedEffort =>
      'May tinukoy na thinking effort ang mga base setting ng host na hindi maaaring i-clear dito para sa non-thinking model. I-update muna ang configuration ng host.';

  @override
  String get engineNewChatDefaultsSaving => 'Sine-save at kinukumpirma ang mga default…';

  @override
  String get engineNewChatDefaultsUnconfirmed =>
      'Hindi makumpirma ang kumpletong mga default. I-refresh at suriin ang model at thinking effort; maaaring binago ito ng mga base setting ng host o ng ibang client.';

  @override
  String get engineModelDefaultSaveFailed =>
      'Nagbago ang model para sa chat na ito, ngunit hindi na-save ang mga default ng bagong chat. Suriin ang Settings › Models at subukang muli.';

  @override
  String get engineAccountSignedIn => 'Naka-sign in sa DeepSeek';

  @override
  String get engineAccountSignOutTitle => 'Mag-sign out sa DeepSeek?';

  @override
  String get engineAccountSignOutBusy =>
      'May mga gawaing gumagamit ng mga account model. Agad silang puputulin ng pag-sign out. Mananatili ang iyong mga chat at file.';

  @override
  String get engineAccountSignOutBody =>
      'Hindi magiging available ang mga account model. Mananatili ang iyong mga chat, file at API key. Maaari kang mag-sign in muli anumang oras.';

  @override
  String get engineAccountSignOutUnknown =>
      'Hindi masuri kung may mga gawaing gumagamit ng mga account model. Puputulin ng pag-sign out ang anumang mayroon.';

  @override
  String get engineAccountSignOutFailed => 'Hindi makapag-sign out. Subukang muli mamaya.';

  @override
  String get engineAccountTitle => 'Account';

  @override
  String get engineAccountRefresh => 'I-refresh';

  @override
  String get engineAccountDeepSeek => 'DeepSeek account';

  @override
  String get engineAccountProfileUnavailable => 'Hindi ma-load ang mga detalye ng account ngayon';

  @override
  String get engineAccountBalance => 'Balanse';

  @override
  String get engineAccountBalanceHint => 'Sinisingil sa iyong balanse ang mga account model';

  @override
  String get engineAccountBalanceEngineOff => 'Simulan ang engine para makita ang iyong balanse';

  @override
  String get engineAccountTopUp => 'Mag-top up';

  @override
  String get engineAccountUsageDetails => 'Mga detalye ng paggamit';

  @override
  String get engineAccountToppedUpBalance => 'Balanse mula sa top-up';

  @override
  String get engineAccountGrantedBalance => 'Ipinagkaloob na balanse';

  @override
  String get engineAccountBalanceUnavailable => 'Hindi ma-load ang iyong balanse ngayon';

  @override
  String get engineAccountNoKeyNeeded => 'Hindi kailangan ng API key kapag naka-sign in';

  @override
  String get engineAccountUnsupported => 'Hindi sinusuportahan ng engine na ito ang pag-sign in sa account';

  @override
  String get engineAccountSignInDeepSeek => 'Mag-sign in gamit ang DeepSeek';

  @override
  String get engineAccountAutoStart => 'Awtomatikong sinisimulan ng pag-sign in ang engine';

  @override
  String get engineAccountReplaceKey => 'Palitan ang key';

  @override
  String get engineAccountClearKeyTitle => 'I-clear ang API key?';

  @override
  String get engineAccountClearKeyBody =>
      'Binubura ang key na naka-save sa app. Habang tumatakbo ang engine sa telepono na ito, binubura rin ang key sa engine.';

  @override
  String get engineAccountBrowserFailed => 'Hindi mabuksan ang browser';

  @override
  String get engineAccountSignInSuccess => 'Naka-sign in';

  @override
  String get engineAccountAlmostReady => 'Malapit nang handa';

  @override
  String get engineAccountStartingEngine => 'Sinisimulan ang engine';

  @override
  String get engineAccountOpenSignInNext => 'Susunod na bubukas ang pahina ng pag-sign in';

  @override
  String get engineAccountPreparingSignIn => 'Inihahanda ang pag-sign in';

  @override
  String get engineAccountOpenDeepSeekNext => 'Binubuksan ang DeepSeek sign-in';

  @override
  String get engineAccountFinishInBrowser => 'Tapusin ang pag-sign in sa iyong browser';

  @override
  String get engineAccountReturnToDsh => 'Bumalik sa JDK-Go pagkatapos mag-sign in';

  @override
  String get engineAccountFinishingSignIn => 'Tinatapos ang pag-sign in';

  @override
  String get engineAccountSavingSignIn => 'Sine-save ang mga detalye ng sign-in';

  @override
  String get engineAccountAwaitingResult => 'Naghihintay pa rin sa pag-sign in';

  @override
  String get engineAccountCopySignInLink => 'Kopyahin ang sign-in link';

  @override
  String get engineAccountReopenSignIn => 'Buksan muli ang sign-in';

  @override
  String get engineAccountCancelSignIn => 'Kanselahin ang pag-sign in';

  @override
  String get engineAccountSignInLinkCopied => 'Nakopya ang sign-in link';

  @override
  String get engineAccountSigningIn => 'Nagsa-sign in';

  @override
  String get engineAccountSignedOut => 'Naka-sign out';

  @override
  String get engineAccountUsageFact => 'Sinisingil sa balanse ng iyong account ang paggamit';

  @override
  String get engineAccountBrowserFact =>
      'Mag-sign in gamit ang iyong browser. Hindi kailanman nakikita ng JDK ang iyong password';

  @override
  String get engineAccountCredentialsFact => 'Nananatili sa telepono na ito ang mga kredensyal ng sign-in';

  @override
  String get engineSubagentTitle => 'Subagent';

  @override
  String get engineAgentLoopTitle => 'Agent loop';

  @override
  String get engineShellTitle => 'Pagpapatupad ng command';

  @override
  String get engineSearchTitle => 'Paghahanap sa web';

  @override
  String get engineSearchNewApiBadge => 'Bagong API';

  @override
  String get engineGeneralTitle => 'Pangkalahatan';

  @override
  String get engineSettingsTitle => 'Mga parameter ng engine';

  @override
  String get engineSettingsReadFailed => 'Hindi ma-load ang mga setting';

  @override
  String get engineSettingsRun => 'Runtime';

  @override
  String get engineSettingsPlugins => 'Mga plugin';

  @override
  String get engineSettingsPluginInventory => 'Imbentaryo ng plugin';

  @override
  String get engineSettingsPluginStopped => 'Hindi tumatakbo ang plugin';

  @override
  String get engineSettingsEnablePlugin => 'I-enable ito para mabago ang mga setting nito';

  @override
  String get engineSettingsNoEditableFields => 'Walang mga setting na babaguhin dito';

  @override
  String get engineFieldRestoreDefault => 'I-reset sa default';

  @override
  String get engineFieldDecrease => 'Bawasan';

  @override
  String get engineFieldIncrease => 'Dagdagan';

  @override
  String get engineFieldRemove => 'Alisin';

  @override
  String get engineFieldShow => 'Ipakita';

  @override
  String get engineFieldFromEnvironment => 'Ibinigay ng startup environment';

  @override
  String get engineFieldItem => 'item';

  @override
  String get engineFieldAlreadyAdded => 'Naidagdag na';

  @override
  String get engineFieldEnterName => 'Maglagay ng pangalan';

  @override
  String get engineFieldEnterNumber => 'Maglagay ng numero';

  @override
  String get engineFieldValue => 'Halaga';

  @override
  String get engineFieldNew => 'Bago';

  @override
  String get engineFieldRequired => 'Kinakailangan';

  @override
  String get engineGeneralMissing => 'Walang pangkalahatang setting ang host na ito';

  @override
  String get engineSettingsVersionRequired => 'Nangangailangan ng JDK 0.2.1 o mas bago';

  @override
  String get engineGeneralWebDisplay => 'Web display';

  @override
  String get engineGeneralWebSending => 'Web sending';

  @override
  String get engineGeneralData => 'Data';

  @override
  String get engineSubagentModelsTitle => 'Mga model ng subagent';

  @override
  String get engineChatLogTitle => 'Mga chat log';

  @override
  String get engineThinkingTranslationTitle => 'Pagsasalin ng pag-iisip';

  @override
  String get enginePluginIndexesTitle => 'Mga index ng plugin market';

  @override
  String get enginePermissionTitle => 'Pahintulot';

  @override
  String get engineAgentPresetsTitle => 'Mga agent preset';

  @override
  String get engineDefaultModelTitle => 'Default na model';

  @override
  String get engineWebAppearanceTitle => 'Hitsura ng web';

  @override
  String get engineLanguageTitle => 'Wika';

  @override
  String get engineFieldCommandTimeout => 'Timeout ng command';

  @override
  String get engineFieldMaxOutput => 'Limitasyon ng output';

  @override
  String get engineFieldMaxTimeout => 'Max na hiniling na timeout';

  @override
  String get engineFieldMaxSpill => 'Limitasyon ng spill file';

  @override
  String get engineFieldGracePeriod => 'Grace period ng pagtigil';

  @override
  String get engineFieldDefaultCwd => 'Default na working directory';

  @override
  String get engineFieldFollowChat => 'Sundin ang chat';

  @override
  String get engineSubagentMaxDepth => 'Pinakamataas na lalim ng recursion';

  @override
  String get engineFieldLayersUnit => 'antas';

  @override
  String get engineSubagentMaxActive => 'Max na aktibong subagent';

  @override
  String get engineFieldCountUnit => 'item';

  @override
  String get engineSubagentAllowModelChoice => 'Hayaang pumili ang AI ng mga model ng subagent';

  @override
  String get engineSubagentAllowedModels => 'Mga available na model';

  @override
  String get engineAgentMaxParallelCalls => 'Mga parallel tool call bawat hakbang';

  @override
  String get engineFieldSearchProvider => 'Serbisyo sa paghahanap';

  @override
  String get engineFieldFetchProvider => 'Serbisyo sa web fetch';

  @override
  String get engineFieldBaseUrl => 'Service URL';

  @override
  String get engineSearchMaxUses => 'Max na paghahanap bawat request';

  @override
  String get engineFieldTimesUnit => 'beses';

  @override
  String get engineSearchHelperModel => 'Helper model';

  @override
  String get engineFieldApiVersion => 'Bersyon ng API';

  @override
  String get engineFieldMaxTokens => 'Max na haba ng output';

  @override
  String get engineSearchResultsPerSearch => 'Mga resulta bawat paghahanap';

  @override
  String get engineFieldResultsUnit => 'resulta';

  @override
  String get engineSearchSendOriginalQuestion => 'Isama ang orihinal mong tanong sa mga paghahanap';

  @override
  String get engineChatLogUpload => 'I-upload ang mga chat log sa DeepSeek';

  @override
  String get engineTranslationProvider => 'Serbisyo sa pagsasalin';

  @override
  String get engineTranslationAccountPaid => 'DeepSeek account (bayad)';

  @override
  String get engineTranslationApiPaid => 'DeepSeek API (bayad)';

  @override
  String get engineTranslationTargetLanguage => 'Target na wika';

  @override
  String get engineTranslationFollowLanguage => 'Sundin ang wika ng interface';

  @override
  String get engineTranslationLanguageHint => 'Maglagay ng auto o language code, tulad ng zh, en o ja';

  @override
  String get enginePluginIndexSources => 'Mga pinagmumulan ng index';

  @override
  String get enginePluginIndexUrl => 'Index URL';

  @override
  String get engineFieldHttpUrlHint => 'Isang URL na nagsisimula sa http:// o https://';

  @override
  String get enginePermissionNewChat => 'Mga pahintulot ng bagong chat';

  @override
  String get engineAgentDefaultPreset => 'Default na agent preset';

  @override
  String get engineProviderTitle => 'Provider';

  @override
  String get engineModelTitle => 'Model';

  @override
  String get engineFieldReasoningEffort => 'Lalim ng pag-iisip';

  @override
  String get engineGeneralShowCodingView => 'Ipakita ang coding view';

  @override
  String get engineGeneralWorkDetails => 'Mga detalye ng trabaho';

  @override
  String get engineFieldCompact => 'Siksik';

  @override
  String get engineFieldStandard => 'Standard';

  @override
  String get engineFieldDetailed => 'Detalyado';

  @override
  String get engineFieldVerbose => 'Verbose';

  @override
  String get engineGeneralCollapseTiming => 'Kailan i-collapse ang mga detalye ng trabaho';

  @override
  String get engineGeneralOnCompletion => 'Sa pagkumpleto';

  @override
  String get engineGeneralOnNewMessage => 'Sa bagong mensahe';

  @override
  String get engineGeneralPerformanceUsage => 'Performance at paggamit';

  @override
  String get engineGeneralLinkOpening => 'Buksan ang mga link sa';

  @override
  String get engineGeneralAppSidebar => 'App sidebar';

  @override
  String get engineGeneralDefaultBrowser => 'Default na browser';

  @override
  String get engineGeneralBusySend => 'Magpadala habang gumagana ang AI';

  @override
  String get engineGeneralQueueSend => 'Ipila';

  @override
  String get engineGeneralSteerSend => 'Gabayan';

  @override
  String get engineFieldTheme => 'Tema';

  @override
  String get engineFieldFontSize => 'Laki ng teksto';

  @override
  String get engineFieldCodeFontSize => 'Laki ng font ng code';

  @override
  String get engineFieldTerminalFontSize => 'Laki ng font ng terminal';

  @override
  String get engineFieldTextFont => 'Font ng teksto';

  @override
  String get engineFieldCodeFont => 'Font ng code';

  @override
  String get engineFieldTerminalFont => 'Font ng terminal';

  @override
  String get engineFieldInterfaceLanguage => 'Wika ng interface';

  @override
  String get engineFieldSecondsUnit => 's';

  @override
  String get engineFieldBytesUnit => 'byte';

  @override
  String get engineFieldGreaterThanZero => 'Higit sa 0';

  @override
  String get engineFieldEnterNumeric => 'Maglagay ng numero';

  @override
  String get engineFieldEnterInteger => 'Maglagay ng buong numero';

  @override
  String get engineFieldInvalidFormat => 'Di-wastong format';

  @override
  String get engineFieldAddress => 'Address';

  @override
  String get engineFieldToken => 'Token';

  @override
  String get engineFieldService => 'Serbisyo';

  @override
  String get engineFieldTimeout => 'Timeout';

  @override
  String get engineFieldQuantity => 'Bilang';

  @override
  String get engineFieldMaxUses => 'Max na paggamit';

  @override
  String get engineFieldMaxRetries => 'Max na pagsubok muli';

  @override
  String get engineFieldConcurrency => 'Concurrency';

  @override
  String get engineFieldInterval => 'Pagitan';

  @override
  String get engineFieldPrompt => 'Prompt';

  @override
  String get engineFieldSystemPrompt => 'System prompt';

  @override
  String get engineFieldTemperature => 'Temperature';

  @override
  String get engineFieldDebugMode => 'Debug mode';

  @override
  String get engineFieldVerboseLogs => 'Verbose na mga log';

  @override
  String get engineFieldPath => 'Path';

  @override
  String get engineFieldCwd => 'Working directory';

  @override
  String get engineFieldCommand => 'Command';

  @override
  String get engineFieldArguments => 'Mga argumento';

  @override
  String get engineFieldEnvironment => 'Mga environment variable';

  @override
  String get engineFieldHeaders => 'Mga header';

  @override
  String get engineFieldProxy => 'Proxy';

  @override
  String get engineFieldAuto => 'Auto';

  @override
  String get engineFieldEnabled => 'Naka-enable';

  @override
  String get engineFieldOn => 'Naka-on';

  @override
  String get engineFieldOff => 'Naka-off';

  @override
  String get engineFieldLow => 'Mababa';

  @override
  String get engineFieldMedium => 'Katamtaman';

  @override
  String get engineFieldHigh => 'Mataas';

  @override
  String get engineFieldMax => 'Max';

  @override
  String get engineFieldNone => 'Wala';

  @override
  String get engineFieldModified => 'Binago';

  @override
  String get engineFieldLocked => 'Itinakda ng config file';

  @override
  String get engineFieldSharedWithModel => 'Ibinabahagi sa mga model';

  @override
  String get engineFieldNotConfigured => 'Hindi naka-configure';

  @override
  String get engineFieldConfigured => 'Naka-configure';

  @override
  String get engineSettingsMissing => 'Walang ganoong setting ang host na ito';

  @override
  String get engineSettingsPluginDisabled => 'Hindi naka-enable ang kinakailangang plugin';

  @override
  String get engineSettingsReadOnly => 'Read-only ang mga setting ng engine';

  @override
  String get engineSubagentSavedUnavailable => 'Na-save ngunit hindi available sa ngayon';

  @override
  String get engineSubagentKeepOneModel => 'Magtira ng kahit isang model';

  @override
  String get engineSubagentLimits => 'Mga limitasyon';

  @override
  String get engineSubagentModelSelection => 'Pagpili ng model';

  @override
  String get engineSubagentPickFirstModel => 'Pumili ng model na ilalapat';

  @override
  String get engineSubagentReadModelsFailed => 'Hindi ma-load ang mga model';

  @override
  String get engineSubagentNoModels => 'Wala pang available na model';

  @override
  String get engineSubagentConnectModel => 'Magdagdag ng provider';

  @override
  String get engineSearchDeepSeek => 'DeepSeek search';

  @override
  String get engineSearchNewApi => 'Bagong search API';

  @override
  String get engineProviderDeleteBody =>
      'Binubura nito ang provider at ang API key nito. Kakailanganin ng ibang model ang mga chat na gumagamit nito.';

  @override
  String get engineProviderReadFailed => 'Hindi ma-load ang mga provider';

  @override
  String get engineProviderGone => 'Wala na ang provider na ito';

  @override
  String get engineProviderProtocol => 'Protocol';

  @override
  String get engineProviderEnterKey => 'Ilagay ang API key';

  @override
  String get engineProviderIssues => 'Mga isyu';

  @override
  String get engineProviderRejectedConfig => 'Tinanggihan ng engine ang ilang setting';

  @override
  String get engineProviderConnection => 'Koneksyon';

  @override
  String get engineProviderDefaultUrl => 'Default na URL';

  @override
  String get engineProviderKeyNotRequired => 'Hindi kailangan';

  @override
  String get engineProviderNoModels => 'Wala pang mga model';

  @override
  String get engineProviderWebConfigured => 'Na-configure sa JDK Web. Maaari mo itong tingnan o burahin dito';

  @override
  String get engineProviderDelete => 'Burahin ang provider';

  @override
  String get engineProviderConfigFile => 'Ibinigay ng config file ng engine. Hindi ito mabubura dito';

  @override
  String get engineProviderTesting => 'Sinusubukan';

  @override
  String get engineProviderTestConnection => 'Subukan ang koneksyon';

  @override
  String get engineProviderKeyFirst => 'Maglagay muna ng API key';

  @override
  String get engineProviderNoDiscoveredModels =>
      'Walang inilistang model ang serbisyo. Idagdag ang mga ito nang manu-mano.';

  @override
  String get engineProviderNeedModel => 'Magdagdag ng kahit isang model';

  @override
  String get engineProviderEdit => 'I-edit ang provider';

  @override
  String get engineProviderAdd => 'Magdagdag ng provider';

  @override
  String get engineProviderBasicInfo => 'Pangunahing impormasyon';

  @override
  String get engineProviderNameHint => 'hal. Aking gateway';

  @override
  String get engineProviderCompatibleProtocol => 'Katugmang protocol';

  @override
  String get engineProviderKeepStoredKey => 'Na-save. Iwanang blangko para panatilihin';

  @override
  String get engineProviderSaving => 'Sine-save';

  @override
  String get engineProviderWaitingEngine => 'Naghihintay sa engine';

  @override
  String get engineProviderFetchingModels => 'Kumukuha ng mga model';

  @override
  String get engineProviderFetchModels => 'Kumuha ng mga model';

  @override
  String get engineProviderAddManually => 'Idagdag nang manu-mano';

  @override
  String get engineProviderManualModel => 'Magdagdag ng model nang manu-mano';

  @override
  String get engineProviderModelId => 'Model ID';

  @override
  String get engineProviderSelectModels => 'Pumili ng mga model';

  @override
  String get engineProviderSearchModels => 'Maghanap ng mga model';

  @override
  String get engineProviderDeselectAll => 'Alisin ang lahat ng pagpili';

  @override
  String get engineProviderSelectAll => 'Piliin lahat';

  @override
  String get engineProviderNoMatchingModels => 'Walang tumutugmang model';

  @override
  String get engineProviderAlreadyAdded => 'Naidagdag';

  @override
  String get engineProviderReady => 'Handa na';

  @override
  String get engineProviderMissingKey => 'Nawawalang API key';

  @override
  String get engineProviderMisconfigured => 'Di-wastong config';

  @override
  String get engineProviderInactive => 'Hindi naka-enable';

  @override
  String get engineProviderConfiguredInWeb => 'Na-configure sa Web';

  @override
  String get engineProvidersTitle => 'Mga model';

  @override
  String get engineProvidersNotConnected => 'Hindi nakakonekta sa engine';

  @override
  String get engineProvidersStartEngine => 'Simulan ang engine para magdagdag ng mga provider';

  @override
  String get engineProvidersUnsupported => 'Hindi sinusuportahan ng host na ito ang mga custom na provider';

  @override
  String get engineProvidersNotConfiguredHere => 'Hindi naka-configure sa host na ito';

  @override
  String get engineProvidersSigningIn => 'Nagsa-sign in…';

  @override
  String get engineProvidersSignInOrKey => 'Mag-sign in o maglagay ng API key';

  @override
  String get engineProvidersOfficial => 'Opisyal';

  @override
  String get engineProvidersSubscription => 'Mga subscription';

  @override
  String get engineProvidersCustom => 'Custom';

  @override
  String get engineProvidersCompatibleHint => 'Mga serbisyong tugma sa OpenAI at Anthropic';

  @override
  String get engineProvidersReadOnly => 'Read-only ang mga setting ng engine. Hindi makapagdagdag ng mga provider';

  @override
  String get engineSubscriptionSignOutBody => 'Aalisin ang mga model nito sa model picker.';

  @override
  String get engineSubscriptionNoModels => 'Walang mga model';

  @override
  String get engineSubscriptionModelsFailed => 'Hindi ma-load ang mga model';

  @override
  String get engineSubscriptionPreparing => 'Naghahanda…';

  @override
  String get engineSubscriptionCancelled => 'Kinansela ang pag-sign in';

  @override
  String get engineSubscriptionIncomplete => 'Hindi kumpleto ang pag-sign in';

  @override
  String get engineSubscriptionWaitingSignIn => 'Naghihintay sa pag-sign in…';

  @override
  String get engineSubscriptionReopen => 'Buksan muli';

  @override
  String get engineSubscriptionCode => 'Verification code';

  @override
  String get engineSubscriptionWaitingVerification => 'Naghihintay sa verification…';

  @override
  String get engineSubscriptionCopyCode => 'Kopyahin ang code';

  @override
  String get engineSubscriptionOpenVerification => 'Buksan ang verification';

  @override
  String get engineSubscriptionPasteRedirect => 'I-paste ang na-redirect na URL';

  @override
  String get engineSubscriptionPasteCode => 'I-paste ang authorization code';

  @override
  String get engineSubscriptionPasteHere => 'I-paste dito';

  @override
  String get engineSubscriptionConfirm => 'Kumpirmahin';

  @override
  String get engineSubscriptionTryAgain => 'Subukan muli';

  @override
  String engineAccountWelcome(String name) {
    return 'Maligayang pagdating, $name';
  }

  @override
  String engineLayerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count antas', one: '1 antas');
    return '$_temp0';
  }

  @override
  String engineFieldDefaultValue(String value) {
    return 'Default $value';
  }

  @override
  String engineFieldDefaultValueUnit(String value, String unit) {
    return 'Default $value $unit';
  }

  @override
  String engineFieldCurrentValue(String value) {
    return 'Kasalukuyan $value';
  }

  @override
  String engineFieldRemoveItem(String name) {
    return 'Alisin ang $name';
  }

  @override
  String engineFieldAddItem(String item) {
    return 'Magdagdag ng $item';
  }

  @override
  String engineFieldItemIndex(int index) {
    return 'Item $index';
  }

  @override
  String engineFieldByteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count byte', one: '1 byte');
    return '$_temp0';
  }

  @override
  String engineFieldHours(String value) {
    return '$value oras';
  }

  @override
  String engineFieldMinutes(String value) {
    return '$value min';
  }

  @override
  String engineFieldSeconds(String value) {
    return '$value s';
  }

  @override
  String engineFieldMilliseconds(String value) {
    return '$value ms';
  }

  @override
  String engineFieldPositiveMax(String max) {
    return 'Higit sa 0, hanggang $max';
  }

  @override
  String engineFieldMin(String min) {
    return 'Hindi bababa sa $min';
  }

  @override
  String engineFieldMaxBound(String max) {
    return 'Hindi hihigit sa $max';
  }

  @override
  String engineFieldBelowMin(String min) {
    return 'Dapat hindi bababa sa $min';
  }

  @override
  String engineFieldAboveMax(String max) {
    return 'Dapat hindi hihigit sa $max';
  }

  @override
  String engineFieldMultiple(String step) {
    return 'Dapat multiple ng $step';
  }

  @override
  String engineFieldMinCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hindi bababa sa $count karakter',
      one: 'Hindi bababa sa 1 karakter',
    );
    return '$_temp0';
  }

  @override
  String engineFieldMaxCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hindi hihigit sa $count karakter',
      one: 'Hindi hihigit sa 1 karakter',
    );
    return '$_temp0';
  }

  @override
  String engineSubagentUnavailableProvider(String provider) {
    return '$provider · Hindi available sa ngayon';
  }

  @override
  String engineProviderDeleteTitle(String name) {
    return 'Burahin ang “$name”?';
  }

  @override
  String engineProviderDeleteFailed(String error) {
    return 'Hindi mabura: $error';
  }

  @override
  String engineProviderModelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Mga model · $count', one: 'Model · 1');
    return '$_temp0';
  }

  @override
  String engineProviderContext(String size) {
    return 'Context $size';
  }

  @override
  String engineProviderTestPassed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nakakonekta · Naglista ng $count model',
      one: 'Nakakonekta · Naglista ng 1 model',
    );
    return '$_temp0';
  }

  @override
  String engineProviderCompletedUrl(String url) {
    return 'Nakumpleto bilang $url';
  }

  @override
  String engineProviderSaveFailed(String error) {
    return 'Hindi na-save: $error';
  }

  @override
  String engineProviderCandidateCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count kabuuan', one: '1 kabuuan');
    return '$_temp0';
  }

  @override
  String engineProviderAddModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Magdagdag ng $count model',
      one: 'Magdagdag ng 1 model',
    );
    return '$_temp0';
  }

  @override
  String engineProviderModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count model', one: '1 model');
    return '$_temp0';
  }

  @override
  String engineProvidersSummary(int total, int ready) {
    String _temp0 = intl.Intl.pluralLogic(total, locale: localeName, other: '$total provider', one: '1 provider');
    return '$_temp0 · $ready handa';
  }

  @override
  String engineProvidersAccount(String name) {
    return 'Account · $name';
  }

  @override
  String engineProvidersSignedInAccount(String account) {
    return 'Naka-sign in · $account';
  }

  @override
  String engineSubscriptionSignIn(String provider) {
    return 'Mag-sign in sa $provider';
  }

  @override
  String engineSubscriptionSignOutTitle(String provider) {
    return 'Mag-sign out sa $provider?';
  }

  @override
  String engineSubscriptionSignOutFailed(String error) {
    return 'Hindi makapag-sign out: $error';
  }

  @override
  String engineSubscriptionCodeSemantics(String code) {
    return 'Verification code $code';
  }

  @override
  String engineFieldItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count item', one: '1 item');
    return '$_temp0';
  }

  @override
  String engineFieldUseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count beses', one: '1 beses');
    return '$_temp0';
  }

  @override
  String engineFieldResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count resulta', one: '1 resulta');
    return '$_temp0';
  }

  @override
  String engineFieldMinCharactersDecimal(String bound) {
    return 'Hindi bababa sa $bound karakter';
  }

  @override
  String engineFieldMaxCharactersDecimal(String bound) {
    return 'Hindi hihigit sa $bound karakter';
  }

  @override
  String engineLayerValue(String value) {
    return '$value antas';
  }

  @override
  String engineFieldEnterPositiveRange(String max) {
    return 'Maglagay ng numerong higit sa 0 at hindi hihigit sa $max';
  }

  @override
  String engineFieldEnterBoundedRange(String min, String max) {
    return 'Maglagay ng numerong mula $min hanggang $max';
  }

  @override
  String get engineModelTokenLimits => 'Mga limitasyon ng token';

  @override
  String get engineModelContextLength => 'Haba ng context';

  @override
  String get engineModelContextOverrideHint =>
      'Ginagamit ng walang laman ang bilang ng katalogo. Ang mas malaking halaga ang ibinabase ng engine sa pagbilang ng context pressure at compaction.';

  @override
  String get engineModelMaxOutput => 'Max na output';

  @override
  String engineModelDefaultSize(String size) {
    return 'Default $size';
  }

  @override
  String get engineModelCapabilities => 'Mga kakayahan';

  @override
  String get engineModelInputType => 'Input';

  @override
  String get engineModelInputText => 'Teksto';

  @override
  String get engineModelInputTextImage => 'Teksto + larawan';

  @override
  String get engineModelThinking => 'Pag-iisip';

  @override
  String get engineModelVision => 'Vision';

  @override
  String get engineModelLevels => 'Mga available na antas';

  @override
  String get engineModelNeedLevel => 'Pumili ng kahit isang antas';

  @override
  String get engineFieldEditOnWeb => 'I-edit ang item na ito sa web';

  @override
  String get engineSettingsHostChanged => 'Nagbago ang host. Buksan muli ang mga setting na ito para mag-edit.';

  @override
  String get engineSecretTargetChanged => 'Nagbago ang field na ito. Buksan muli ito para mag-edit.';

  @override
  String engineSettingsGroupCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count setting', one: '1 setting');
    return '$_temp0';
  }

  @override
  String get featuresCordisSubtitle => 'Mga dynamic na plugin · Nililinis kapag nag-restart ang engine';

  @override
  String get featuresCordisUnavailable => 'Hindi available dito ang Cordis';

  @override
  String get featuresCordisRemoteUnavailable => 'Hindi available sa JDK Remote';

  @override
  String get featuresCordisReadFailed => 'Hindi ma-load ang mga plugin';

  @override
  String get featuresCordisEmpty => 'Wala pang dynamic na plugin';

  @override
  String get featuresCordisEmptyHint => 'Lalabas dito ang mga plugin kapag nalikha na';

  @override
  String get featuresCurrentChat => 'Kasalukuyang chat';

  @override
  String get featuresOtherChats => 'Ibang mga chat';

  @override
  String featuresPresetDefaultSet(String name) {
    return 'Gagamitin ng mga bagong chat ang “$name”';
  }

  @override
  String get featuresPresetDefaultFailed => 'Hindi maitakda bilang default';

  @override
  String featuresPresetDeleteTitle(String name) {
    return 'Burahin ang “$name”?';
  }

  @override
  String get featuresPresetDeleteHint =>
      'Hindi na ito magiging available para sa mga bagong chat. Mananatili ang mga umiiral na chat.';

  @override
  String get featuresDeleted => 'Nabura';

  @override
  String get featuresDeleteFailed => 'Hindi mabura';

  @override
  String get featuresPresetAlreadyDefault => 'Default para sa mga bagong chat';

  @override
  String get featuresPresetSetDefault => 'Gamitin para sa mga bagong chat';

  @override
  String get featuresPresetViewConfig => 'Tingnan ang configuration';

  @override
  String get featuresPresetDuplicate => 'I-duplicate ang preset';

  @override
  String get featuresPresetDefaultDeleteHint => 'Magtakda muna ng ibang preset bilang default para sa mga bagong chat';

  @override
  String get featuresAgentPresets => 'Mga agent preset';

  @override
  String get featuresAgentPresetsSubtitle => 'Mga tool at kilos para sa mga bagong chat';

  @override
  String get featuresNew => 'Bago';

  @override
  String get featuresPresetsReadFailed => 'Hindi ma-load ang mga agent preset';

  @override
  String get featuresLoadFailed => 'Hindi ma-load';

  @override
  String get featuresNewChatDefault => 'Default para sa mga bagong chat';

  @override
  String get featuresEmptyDocument => '(Walang laman)';

  @override
  String get featuresReadFailed => 'Hindi mabasa';

  @override
  String featuresTodayTime(String time) {
    return 'Ngayon $time';
  }

  @override
  String featuresTomorrowTime(String time) {
    return 'Bukas $time';
  }

  @override
  String featuresYesterdayTime(String time) {
    return 'Kahapon $time';
  }

  @override
  String featuresScheduleSummaryNext(String rule, String time) {
    return '$rule · Susunod $time';
  }

  @override
  String get featuresEnded => 'Tapos na';

  @override
  String featuresScheduleSummaryEnded(String time) {
    return 'Tapos na · Tumakbo $time';
  }

  @override
  String featuresJobElapsed(String span) {
    return 'Tumatakbo sa loob ng $span';
  }

  @override
  String featuresJobDuration(String span) {
    return 'Inabot ng $span';
  }

  @override
  String get featuresPermissionReadOnly => 'Read only';

  @override
  String get featuresPermissionWorkspaceWrite => 'Workspace write';

  @override
  String get featuresPermissionFullAccess => 'Full access';

  @override
  String get featuresPermissionAutoReview => 'Auto review';

  @override
  String get featuresPermissionCustom => 'Custom';

  @override
  String get featuresPermissionReadOnlyHint => 'Tingnan ang mga file nang hindi binabago';

  @override
  String get featuresPermissionWorkspaceWriteHint => 'I-edit ang mga file ng workspace; magtanong bago lumampas';

  @override
  String get featuresPermissionFullAccessHint => 'Patakbuhin nang hindi nagtatanong';

  @override
  String get featuresPermissionAutoReviewHint =>
      'Sinusuri ng model ang bawat aksyon at nagtatanong kapag hindi sigurado';

  @override
  String get featuresPresetStandard => 'Standard mode';

  @override
  String get featuresPresetPtc => 'PTC mode';

  @override
  String get featuresPresetMinimal => 'Minimal mode';

  @override
  String get featuresPresetCreator => 'Creator mode';

  @override
  String get featuresPresetStandardDescription => 'Code, mga file at pananaliksik para sa karamihan ng gawain';

  @override
  String get featuresPresetPtcDescription => 'Batch na mga tool call, saka i-filter, suriin at ibuod';

  @override
  String get featuresPresetMinimalDescription =>
      'Terminal at pagtingin sa larawan lang, para sa pagsubok at paghahambing';

  @override
  String get featuresPresetCreatorDescription => 'Ipasulat sa agent ang mga plugin para i-customize ang JDK';

  @override
  String featuresHostUnreachable(String name) {
    return 'Hindi makakonekta sa “$name”';
  }

  @override
  String featuresHostConnecting(String name) {
    return 'Kumokonekta sa “$name”…';
  }

  @override
  String get featuresJobs => 'Mga background job';

  @override
  String get featuresJobsSubtitle => 'Nililinis kapag nag-restart ang engine';

  @override
  String get featuresJobsReadFailed => 'Hindi ma-load ang mga background job';

  @override
  String get featuresJobsEmpty => 'Walang background job';

  @override
  String get featuresJobsEmptyHint => 'Lalabas dito ang mga command tulad ng dev server';

  @override
  String featuresJobsEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Tapos na · $count', one: 'Tapos na · 1');
    return '$_temp0';
  }

  @override
  String get featuresJobStopTitle => 'Ihinto ang job na ito?';

  @override
  String get featuresJobAlreadyEnded => 'Tapos na ang job na ito';

  @override
  String get featuresJobStopFailed => 'Hindi mahinto';

  @override
  String get featuresJobOutput => 'Output ng job';

  @override
  String get featuresOutput => 'Output';

  @override
  String featuresJobRecentLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Huling $count linya',
      one: 'Huling 1 linya',
    );
    return '$_temp0';
  }

  @override
  String get featuresJobOutputSubject => 'Output ng JDK job';

  @override
  String get featuresJobOutputReadFailed => 'Hindi mabasa ang output';

  @override
  String get featuresJobOutputWaiting => 'Naghihintay ng output…';

  @override
  String get featuresJobOutputEmpty => 'Walang output';

  @override
  String get featuresPermissionAutoTitle => 'I-on ang Auto review?';

  @override
  String get featuresPermissionAutoWarning =>
      'Ang model ang magpapasya kung papayagan ang bawat aksyon. Maaari itong magkamali.';

  @override
  String get featuresSwitchFailed => 'Hindi makalipat';

  @override
  String get featuresPermissions => 'Mga pahintulot';

  @override
  String get featuresPermissionsSubtitle =>
      'Piliin kung kailan magtatanong bago magpatakbo ng mga command o mag-edit ng mga file';

  @override
  String get featuresPermissionsReadFailed => 'Hindi ma-load ang mga pahintulot';

  @override
  String get featuresPermissionCustomHint => 'Papalitan ng pagpili ng preset ang iyong mga custom na pahintulot';

  @override
  String get featuresModuleInstructions => 'Mga tagubilin ng workspace';

  @override
  String get featuresModuleTime => 'Pag-alam sa oras';

  @override
  String get featuresModuleBash => 'Bash command tool';

  @override
  String get featuresModulePersistentBash => 'Persistent na Bash tool';

  @override
  String get featuresModulePowerShell => 'PowerShell command tool';

  @override
  String get featuresModuleFiles => 'Tool sa pagbasa/pagsulat ng file';

  @override
  String get featuresModuleFileSearch => 'Tool sa paghahanap ng file';

  @override
  String get featuresModuleJobs => 'Tool ng background job';

  @override
  String get featuresModuleSchedule => 'Tool ng automation';

  @override
  String get featuresModuleLocalSkills => 'Lokal na pag-load ng skill';

  @override
  String get featuresModuleSkillTool => 'Tool sa pag-load ng skill';

  @override
  String get featuresModuleGoalCommand => 'Command sa pamamahala ng layunin';

  @override
  String get featuresModuleGoalTool => 'Tool sa pamamahala ng layunin';

  @override
  String get featuresModulePlan => 'Plan mode';

  @override
  String get featuresModuleCompaction => 'Context compaction';

  @override
  String get featuresModuleCompactCommand => 'Command ng context compaction';

  @override
  String get featuresModuleAskUser => 'Ask user tool';

  @override
  String get featuresModuleTodo => 'Todo list tool';

  @override
  String get featuresModuleWeb => 'Tool sa paghahanap at pagkuha sa web';

  @override
  String get featuresModulePresent => 'Tool sa paghahatid ng file';

  @override
  String get featuresModuleCordis => 'Tool sa paghahanap ng plugin API';

  @override
  String get featuresModuleSubagent => 'Tool sa delegasyon ng subagent';

  @override
  String get featuresModuleSubagentControl => 'Tool sa kontrol ng subagent';

  @override
  String get featuresModuleWorkflow => 'Workflow tool';

  @override
  String get featuresModulePluginManager => 'Tool sa pamamahala ng plugin';

  @override
  String get featuresModulePluginMarket => 'Tool ng plugin marketplace';

  @override
  String get featuresModuleToolCalls => 'Istilo ng tool call';

  @override
  String get featuresModuleTerminal => 'Persistent na serbisyo ng terminal';

  @override
  String get featuresModulePersona => 'Persona ng agent';

  @override
  String get featuresGroupDelegation => 'Delegasyon ng subagent';

  @override
  String get featuresGroupTerminal => 'Persistent na terminal';

  @override
  String get featuresPresetIdRequired => 'Maglagay ng ID';

  @override
  String get featuresPresetIdLength => 'Hanggang 40 karakter';

  @override
  String get featuresPresetIdFormat => 'Gumamit ng maliliit na letra, numero at gitling';

  @override
  String get featuresPresetIdTaken => 'Ginagamit na ang ID na ito';

  @override
  String featuresPresetCopyName(String name) {
    return 'Kopya ng $name';
  }

  @override
  String get featuresPresetBasedOn => 'Batay sa';

  @override
  String get featuresNameRequired => 'Maglagay ng pangalan';

  @override
  String get featuresCreatorOpenFailed => 'Hindi mabuksan ang Creator mode';

  @override
  String get featuresPresetNameHint => 'Halimbawa: Code review';

  @override
  String get featuresPresetId => 'ID';

  @override
  String get featuresPresetIdHint => 'Maliliit na letra, numero at gitling';

  @override
  String get featuresPresetDescription => 'Paglalarawan';

  @override
  String get featuresPresetDescriptionHint => 'Ilarawan sa isang pangungusap kung para saan ito';

  @override
  String get featuresPresetConfigReadFailed => 'Hindi ma-load ang configuration ng preset';

  @override
  String get featuresPresetCreateTitle => 'Bagong agent preset';

  @override
  String get featuresPresetDuplicateTitle => 'I-duplicate ang agent preset';

  @override
  String get featuresPresetEditTitle => 'I-edit ang agent preset';

  @override
  String get featuresCreatorOpening => 'Binubuksan ang Creator mode';

  @override
  String get featuresWaitingEngine => 'Naghihintay sa engine';

  @override
  String get featuresCreatorUnavailable => 'Hindi available ang Creator mode';

  @override
  String get featuresPresetStartUpdate => 'Simulan ang pag-update';

  @override
  String get featuresPresetStartCreate => 'Simulan ang paglikha';

  @override
  String get featuresPresetSystemPrompt => 'System prompt';

  @override
  String get featuresPresetSystemPromptHint => 'Kung sino ka at paano ka nagtatrabaho';

  @override
  String get featuresPresetReplaceSystemPrompt => 'Palitan ang buong system prompt';

  @override
  String get featuresPresetTools => 'Mga tool';

  @override
  String get featuresSkills => 'Mga skill';

  @override
  String get featuresPresetContextModes => 'Context at mga mode';

  @override
  String get featuresCronMinute => 'Minuto';

  @override
  String get featuresCronHour => 'Oras';

  @override
  String get featuresDate => 'Petsa';

  @override
  String get featuresCronMonth => 'Buwan';

  @override
  String get featuresCronWeekday => 'Araw ng linggo';

  @override
  String get featuresCronRequired => 'Maglagay ng 5-field na Cron expression';

  @override
  String get featuresCronWhitespace => 'Walang espasyo sa simula o dulo';

  @override
  String featuresCronFieldCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Inaasahan ang 5 field, nakuha ay $count',
      one: 'Inaasahan ang 5 field, nakuha ay 1',
    );
    return '$_temp0';
  }

  @override
  String featuresCronInvalidField(int index, String name) {
    return 'Di-wasto ang field $index ($name)';
  }

  @override
  String get featuresWeekdayMon => 'Lun';

  @override
  String get featuresWeekdayTue => 'Mar';

  @override
  String get featuresWeekdayWed => 'Miy';

  @override
  String get featuresWeekdayThu => 'Huw';

  @override
  String get featuresWeekdayFri => 'Biy';

  @override
  String get featuresWeekdaySat => 'Sab';

  @override
  String get featuresWeekdaySun => 'Lin';

  @override
  String get featuresMonthJan => 'Enero';

  @override
  String get featuresMonthFeb => 'Pebrero';

  @override
  String get featuresMonthMar => 'Marso';

  @override
  String get featuresMonthApr => 'Abril';

  @override
  String get featuresMonthMay => 'Mayo';

  @override
  String get featuresMonthJun => 'Hunyo';

  @override
  String get featuresMonthJul => 'Hulyo';

  @override
  String get featuresMonthAug => 'Agosto';

  @override
  String get featuresMonthSep => 'Setyembre';

  @override
  String get featuresMonthOct => 'Oktubre';

  @override
  String get featuresMonthNov => 'Nobyembre';

  @override
  String get featuresMonthDec => 'Disyembre';

  @override
  String featuresWeekdayName(String day) {
    return '$day';
  }

  @override
  String featuresCronWeekdayRange(String first, String last) {
    return '$first–$last';
  }

  @override
  String featuresCronEveryDay(String months) {
    return 'Araw-araw$months';
  }

  @override
  String featuresCronMonthDays(String days, String months) {
    return 'Buwan-buwan sa $days$months';
  }

  @override
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months) {
    return 'Buwan-buwan sa $days, kung $weekdays$months';
  }

  @override
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months) {
    return 'Buwan-buwan sa $days o $weekdays$months';
  }

  @override
  String featuresCronHourRange(String first, String last) {
    return '$first hanggang $last';
  }

  @override
  String get featuresEveryMinute => 'Bawat minuto';

  @override
  String featuresCronEveryMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Bawat $count minuto', one: 'Bawat minuto');
    return '$_temp0';
  }

  @override
  String get featuresEveryHour => 'Bawat oras';

  @override
  String featuresCronHourlyMinutes(String minutes) {
    return 'Sa minutong $minutes ng bawat oras';
  }

  @override
  String featuresCronHoursEveryMinute(String hours) {
    return 'Bawat minuto sa oras $hours';
  }

  @override
  String featuresCronHoursEveryMinutes(String hours, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bawat $count minuto sa oras $hours',
      one: 'Bawat minuto sa oras $hours',
    );
    return '$_temp0';
  }

  @override
  String featuresCronEveryHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Bawat $count oras', one: 'Bawat oras');
    return '$_temp0';
  }

  @override
  String featuresCronHoursMinutes(String hours, String minutes) {
    return 'Sa minutong $minutes sa oras $hours';
  }

  @override
  String get featuresRepeatDaily => 'Araw-araw';

  @override
  String get featuresRepeatWeekdays => 'Mga weekday';

  @override
  String get featuresRepeatWeekly => 'Lingguhan';

  @override
  String get featuresRepeatMonthly => 'Buwanan';

  @override
  String get featuresRepeatInterval => 'Pagitan';

  @override
  String get featuresRepeatOnce => 'Isang beses';

  @override
  String get featuresRepeatAdvanced => 'Advanced';

  @override
  String get featuresRepeatCustom => 'Custom';

  @override
  String get featuresIntervalSeconds => 'Mga segundo';

  @override
  String get featuresZoneUnavailable => 'Hindi available ang time zone';

  @override
  String get featuresChooseDay => 'Pumili ng kahit isang araw';

  @override
  String get featuresIntervalMinimum => 'Dapat hindi bababa sa 1 ang pagitan';

  @override
  String get featuresMinimumMinute => 'Hindi bababa sa 1 minuto';

  @override
  String get featuresTimeDoesNotExist => 'Hindi umiiral ang oras na ito sa time zone na ito';

  @override
  String get featuresChooseFutureTime => 'Pumili ng oras sa hinaharap';

  @override
  String get featuresCronNeverRuns => 'Hindi kailanman tatakbo ang expression na ito';

  @override
  String featuresRuleDaily(String time) {
    return 'Araw-araw ng $time';
  }

  @override
  String featuresRuleWeekdays(String time) {
    return 'Mga weekday ng $time';
  }

  @override
  String featuresRuleWeekends(String time) {
    return 'Mga weekend ng $time';
  }

  @override
  String featuresRuleWeekly(String days, String time) {
    return 'Bawat $days ng $time';
  }

  @override
  String featuresRuleMonthly(String days, String time) {
    return 'Buwan-buwan sa $days ng $time';
  }

  @override
  String get featuresRepeat => 'Ulitin';

  @override
  String get featuresChat => 'Chat';

  @override
  String get featuresWorkspace => 'Workspace';

  @override
  String get featuresInstructionRequired => 'Maglagay ng mga tagubilin';

  @override
  String featuresScheduleSaveError(String reason) {
    return 'Hindi na-save: $reason';
  }

  @override
  String featuresScheduleCreateError(String reason) {
    return 'Hindi nalikha: $reason';
  }

  @override
  String get featuresScheduleNameHint => 'Halimbawa: Paalala sa daily standup';

  @override
  String get featuresScheduleInstruction => 'Mga tagubilin';

  @override
  String get featuresScheduleInstructionHint => 'Halimbawa: Ibuod ang mga commit kahapon para sa akin';

  @override
  String get featuresScheduleRunTime => 'Oras ng pagtakbo';

  @override
  String get featuresScheduleOpenChat => 'Tingnan ang chat';

  @override
  String get featuresScheduleEditTitle => 'I-edit ang automation';

  @override
  String get featuresScheduleCreateTitle => 'Bagong automation';

  @override
  String get featuresScheduleSaving => 'Sine-save';

  @override
  String get featuresScheduleCreating => 'Nililikha sa chat';

  @override
  String get featuresTime => 'Oras';

  @override
  String get featuresNotSelected => 'Hindi napili';

  @override
  String featuresMonthDaysLabel(String days) {
    return 'Araw $days';
  }

  @override
  String get featuresTimeZone => 'Time zone';

  @override
  String get featuresScheduleRunLocation => 'Patakbuhin sa';

  @override
  String get featuresJustCreatedChat => 'Bagong likhang chat';

  @override
  String get featuresModel => 'Model';

  @override
  String get featuresRequestRefused => 'Hindi tinanggap ng engine ang kahilingang ito';

  @override
  String get featuresScheduleNotFound => 'Wala na ang automation na ito';

  @override
  String get featuresScheduleEndedError => 'Tapos na ang automation na ito at hindi na maie-edit';

  @override
  String get featuresScheduleConflict => 'Kababago lang ng automation na ito. Bumalik at subukang muli.';

  @override
  String get featuresScheduleInvalidPrompt =>
      'Maglagay ng pangalan at mga tagubilin. Hanggang 120 karakter ang mga pangalan.';

  @override
  String get featuresScheduleInvalidTime => 'Di-wastong oras ng pagtakbo';

  @override
  String get featuresScheduleIntervalTooShort => 'Dapat hindi bababa sa 1 minuto ang pagitan';

  @override
  String get featuresScheduleTimeOutOfRange => 'Wala sa saklaw ang oras';

  @override
  String get featuresScheduleSubagentError => 'Hindi makatanggap ng mga automation ang chat na ito';

  @override
  String get featuresEvery => 'Bawat';

  @override
  String get featuresCronExpression => 'Cron expression';

  @override
  String get featuresCronFieldGuide => 'Min  Oras  Araw  Buwan  Weekday';

  @override
  String featuresZoneTimeSuffix(String city) {
    return ' (oras sa $city)';
  }

  @override
  String get featuresScheduleNextLocal => 'Mga susunod na takbo (oras ng telepono na ito)';

  @override
  String get featuresScheduleNext => 'Mga susunod na takbo';

  @override
  String featuresMonthDayChoice(int day) {
    return 'Araw $day';
  }

  @override
  String get featuresZonesCommon => 'Karaniwan';

  @override
  String get featuresZonesAll => 'Lahat';

  @override
  String get featuresZoneSearchHint => 'Maghanap ng mga lungsod, time zone o UTC offset';

  @override
  String get featuresZonesNoMatch => 'Walang tumutugmang time zone';

  @override
  String get featuresZoneUTC => 'Coordinated Universal Time';

  @override
  String get featuresZoneShanghai => 'Shanghai';

  @override
  String get featuresZoneUrumqi => 'Urumqi';

  @override
  String get featuresZoneHongKong => 'Hong Kong';

  @override
  String get featuresZoneMacau => 'Macau';

  @override
  String get featuresZoneTaipei => 'Taipei';

  @override
  String get featuresZoneTokyo => 'Tokyo';

  @override
  String get featuresZoneSeoul => 'Seoul';

  @override
  String get featuresZoneSingapore => 'Singapore';

  @override
  String get featuresZoneKualaLumpur => 'Kuala Lumpur';

  @override
  String get featuresZoneBangkok => 'Bangkok';

  @override
  String get featuresZoneHoChiMinh => 'Ho Chi Minh City';

  @override
  String get featuresZoneJakarta => 'Jakarta';

  @override
  String get featuresZoneManila => 'Maynila';

  @override
  String get featuresZoneKolkata => 'Kolkata';

  @override
  String get featuresZoneDubai => 'Dubai';

  @override
  String get featuresZoneJerusalem => 'Jerusalem';

  @override
  String get featuresZoneLondon => 'London';

  @override
  String get featuresZoneDublin => 'Dublin';

  @override
  String get featuresZoneLisbon => 'Lisbon';

  @override
  String get featuresZoneParis => 'Paris';

  @override
  String get featuresZoneBerlin => 'Berlin';

  @override
  String get featuresZoneMadrid => 'Madrid';

  @override
  String get featuresZoneRome => 'Roma';

  @override
  String get featuresZoneAmsterdam => 'Amsterdam';

  @override
  String get featuresZoneZurich => 'Zurich';

  @override
  String get featuresZoneStockholm => 'Stockholm';

  @override
  String get featuresZoneWarsaw => 'Warsaw';

  @override
  String get featuresZoneAthens => 'Athens';

  @override
  String get featuresZoneIstanbul => 'Istanbul';

  @override
  String get featuresZoneMoscow => 'Moscow';

  @override
  String get featuresZoneCairo => 'Cairo';

  @override
  String get featuresZoneJohannesburg => 'Johannesburg';

  @override
  String get featuresZoneLagos => 'Lagos';

  @override
  String get featuresZoneNewYork => 'New York';

  @override
  String get featuresZoneToronto => 'Toronto';

  @override
  String get featuresZoneChicago => 'Chicago';

  @override
  String get featuresZoneDenver => 'Denver';

  @override
  String get featuresZonePhoenix => 'Phoenix';

  @override
  String get featuresZoneLosAngeles => 'Los Angeles';

  @override
  String get featuresZoneVancouver => 'Vancouver';

  @override
  String get featuresZoneAnchorage => 'Anchorage';

  @override
  String get featuresZoneMexicoCity => 'Mexico City';

  @override
  String get featuresZoneBogota => 'Bogota';

  @override
  String get featuresZoneLima => 'Lima';

  @override
  String get featuresZoneSantiago => 'Santiago';

  @override
  String get featuresZoneSaoPaulo => 'Sao Paulo';

  @override
  String get featuresZoneBuenosAires => 'Buenos Aires';

  @override
  String get featuresZoneHonolulu => 'Honolulu';

  @override
  String get featuresZoneAuckland => 'Auckland';

  @override
  String get featuresZoneSydney => 'Sydney';

  @override
  String get featuresZoneMelbourne => 'Melbourne';

  @override
  String get featuresZoneBrisbane => 'Brisbane';

  @override
  String get featuresZonePerth => 'Perth';

  @override
  String get featuresScheduleCreated => 'Nalikha';

  @override
  String get featuresSchedulesReadFailed => 'Hindi ma-load ang mga automation';

  @override
  String get featuresSchedulesEmpty => 'Wala pang automation';

  @override
  String get featuresSchedulesEmptyHint => 'Ipadala sa isang chat at awtomatikong patakbuhin sa nakaiskedyul na oras';

  @override
  String get featuresScheduleNewTask => 'Bagong automation';

  @override
  String get featuresSchedulesNoMatch => 'Walang tumutugmang automation';

  @override
  String get featuresSchedulesNoActive => 'Walang aktibong automation';

  @override
  String get featuresSchedulesNoEnded => 'Walang natapos na automation';

  @override
  String get featuresSchedules => 'Mga automation';

  @override
  String get featuresSchedulesSubtitle => 'Ipadala sa orihinal na chat sa nakaiskedyul na oras';

  @override
  String get featuresSchedulesSearch => 'Maghanap ng mga automation';

  @override
  String featuresSchedulesAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Lahat $count', one: 'Lahat 1');
    return '$_temp0';
  }

  @override
  String get featuresScheduleUntitled => 'Automation na walang pamagat';

  @override
  String get featuresScheduleSent => 'Naipadala sa chat';

  @override
  String get featuresView => 'Tingnan';

  @override
  String get featuresSendFailed => 'Hindi naipadala';

  @override
  String get featuresScheduleDeleteTitle => 'Burahin ang automation na ito?';

  @override
  String get featuresScheduleDeleteHint =>
      'Titigil ang mga susunod na takbo at mabubura ang kasaysayan ng pagtakbo. Mananatili ang orihinal na chat.';

  @override
  String get featuresScheduleDeleted => 'Nabura ang automation';

  @override
  String get featuresScheduleActive => 'Aktibo';

  @override
  String get featuresScheduleRun => 'Takbo';

  @override
  String get featuresScheduleNextRun => 'Susunod';

  @override
  String get featuresScheduleLastRun => 'Huli';

  @override
  String get featuresScheduleRule => 'Patakaran';

  @override
  String get featuresScheduleLinkedChat => 'Naka-link na chat';

  @override
  String get featuresScheduleChatDeleted => 'Nabura ang chat';

  @override
  String get featuresScheduleEdit => 'I-edit ang automation';

  @override
  String get featuresScheduleRunNow => 'Patakbuhin ngayon';

  @override
  String get featuresScheduleHistory => 'Kasaysayan ng pagtakbo';

  @override
  String get featuresScheduleNeverRun => 'Wala pang takbo';

  @override
  String get featuresScheduleHistoryUnavailable => 'Hindi available ang kasaysayan';

  @override
  String get featuresScheduleHistoryReadFailed => 'Hindi ma-load ang kasaysayan ng pagtakbo';

  @override
  String get featuresScheduleDelete => 'Burahin ang automation';

  @override
  String featuresExportSavedTo(String path) {
    return 'Na-save sa $path';
  }

  @override
  String get featuresExportTitle => 'I-export ang mga chat log';

  @override
  String get featuresExportSubtitle => 'Isang ZIP para sa feedback o backup';

  @override
  String get featuresExportUnavailable => 'Hindi ma-export sa koneksyong ito';

  @override
  String get featuresExportRemoteHint =>
      'Hindi available ang mga log sa JDK Remote. I-export ang mga ito mula sa JDK Web sa iyong computer.';

  @override
  String get featuresExportShareHint => 'I-attach sa feedback o ipadala sa sarili';

  @override
  String get featuresExportSaveDownloads => 'I-save sa Downloads';

  @override
  String get featuresExportDownloadsHint => 'I-save sa Downloads/DSH-Go';

  @override
  String get featuresExportContents => 'Lahat ng talaan at attachment mula sa chat na ito at sa mga subagent nito';

  @override
  String get featuresSkillUseHere => 'Gamitin sa chat';

  @override
  String get featuresSkillUseNew => 'Bagong chat';

  @override
  String get featuresSkillsCallHint => 'I-type ang /skill-name para gamitin';

  @override
  String get featuresSkillsReadFailed => 'Hindi ma-load ang mga skill';

  @override
  String get featuresSkillsEmpty => 'Wala pang skill sa chat na ito';

  @override
  String get featuresSkillsEmptyHint => 'Lalabas dito ang mga skill sa .dsh/skills';

  @override
  String get featuresSkillsSourceHint => 'Mula sa mga skills folder ng proyekto at ~/.dsh';

  @override
  String featuresSkillUsage(String usage) {
    return 'Para sa: $usage';
  }

  @override
  String get featuresSkillManual => 'Manu-mano lang';

  @override
  String featuresArtifactsSemantic(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mga output file, $count file, tingnan lahat',
      one: 'Mga output file, 1 file, tingnan lahat',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsTitle => 'Mga output file';

  @override
  String featuresArtifactsAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Lahat $count', one: 'Lahat 1');
    return '$_temp0';
  }

  @override
  String featuresArtifactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count file', one: '1 file');
    return '$_temp0';
  }

  @override
  String get featuresArtifactsNoFiles => 'Wala pang file';

  @override
  String featuresArtifactsTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file · Naihatid at nabuo',
      one: '1 file · Naihatid at nabuo',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsEmpty => 'Wala pang output file';

  @override
  String get featuresArtifactsEmptyHint => 'Lalabas dito ang mga file na inihatid o binuo ng AI';

  @override
  String get featuresListSeparator => ',';

  @override
  String featuresErrorReason(String title, String reason) {
    return '$title: $reason';
  }

  @override
  String featuresYearDate(int year, String date) {
    return '$date, $year';
  }

  @override
  String featuresDateWeekdayTime(String date, String week, String time) {
    return '$week, $date $time';
  }

  @override
  String featuresDateWeekday(String date, String day) {
    return '$day, $date';
  }

  @override
  String featuresOnceDescription(String rule, String date, String time) {
    return '$rule · $date $time';
  }

  @override
  String featuresCronMonthSuffix(String months) {
    return ' ($months)';
  }

  @override
  String featuresRuleIntervalSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bawat $count segundo',
      one: 'Bawat segundo',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Bawat $count minuto', one: 'Bawat minuto');
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Bawat $count oras', one: 'Bawat oras');
    return '$_temp0';
  }

  @override
  String featuresSchedulesActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Aktibo $count', one: 'Aktibo 1');
    return '$_temp0';
  }

  @override
  String featuresSchedulesEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Tapos na $count', one: 'Tapos na 1');
    return '$_temp0';
  }

  @override
  String featuresScheduleRetention(int days, int count) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Huling $days araw', one: 'Huling 1 araw');
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hanggang $count entry',
      one: 'hanggang 1 entry',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String featuresScheduleRetentionUnknown(int days) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Huling $days araw', one: 'Huling 1 araw');
    return '$_temp0, hindi available ang limitasyon ng entry';
  }

  @override
  String featuresArtifactsDeliveredTurn(int turn) {
    return 'Turn $turn · Naihatid';
  }

  @override
  String featuresArtifactsGeneratedTurn(int turn) {
    return 'Turn $turn · Nabuo';
  }

  @override
  String featuresPresetCreateRequest(String name, String id, String directory) {
    return 'Lumikha ng agent preset na “$name” ($id): Isulat nang eksakto ang dalawang file na ito sa workspace, saka gamitin ang install_bundle ng plugin_manager para i-install ang directory na `$directory`. Ito lang ang gawin.\n\n';
  }

  @override
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory) {
    return 'I-update ang agent preset na “$name” ($id): Isulat nang eksakto ang dalawang file na ito sa workspace. Gamitin ang plugin_manager para alisin ang bundle na `$replacing`, saka gamitin ang install_bundle para i-install ang directory na `$directory`. Ito lang ang gawin.\n\n';
  }

  @override
  String featuresZoneThisPhone(String city) {
    return '$city · Telepono na ito';
  }

  @override
  String get featuresPermissionResetHint => 'Hindi na wasto ang default ng bagong chat';

  @override
  String get featuresPermissionResetDefault => 'Ibalik ang default';

  @override
  String get fileImageName => 'larawan';

  @override
  String get fileSharedText => 'Shared text.txt';

  @override
  String get fileChatFallback => 'chat';

  @override
  String get fileUploadToHost => 'Magpadala ng mga file sa computer';

  @override
  String get fileUploadToHostHint => 'Sa workspace ng usapang ito sa computer, hindi naka-compress';

  @override
  String fileUploadProgress(int done, int total, String name) {
    return 'Nagpapadala $done/$total: $name';
  }

  @override
  String fileUploadDone(String names) {
    return 'Naipadala sa computer: $names';
  }

  @override
  String get fileUploadFailed => 'Hindi naipadala sa computer';

  @override
  String get hostDetailsConnectionType => 'Uri ng koneksyon';

  @override
  String get hostDetailsSshNetworkHint =>
      'Gumagamit ng SSH tunnel. Hindi available ang pagsusuri ng LAN / P2P na ruta at pagsukat ng latency para sa koneksyong ito.';

  @override
  String get hubSessionDetails => 'Mga detalye ng chat';

  @override
  String get hubTerminal => 'Terminal';

  @override
  String get hubSessionNoTurns => 'Wala pang kumpletong turn';

  @override
  String get hubSessionElapsed => 'Oras';

  @override
  String get hubSessionSteps => 'Mga hakbang';

  @override
  String get hubSessionChangedFiles => 'Mga file na nabago';

  @override
  String get hubSessionTrajectoryHint => 'Lalabas dito ang mga hakbang at oras ng bawat turn';

  @override
  String get hubSessionLoadEarlier => 'I-load ang mga naunang turn';

  @override
  String get hubSessionError => 'Error';

  @override
  String get hubSessionInterrupted => 'Naantala';

  @override
  String get hubSessionOutputLimit => 'Naabot ang limitasyon ng output';

  @override
  String get hubSessionNoChanges => 'Wala pang nabagong file';

  @override
  String get hubSessionShellChangesHint => 'Hindi ipinapakita rito ang mga file na nabago gamit ang shell command';

  @override
  String get hubSessionChanges => 'Mga pagbabago sa chat';

  @override
  String get hubSessionChangesNote =>
      'Mga pagbabagong ginawa lang gamit ang write at edit tool sa na-load na kasaysayan ang kasama';

  @override
  String get hubSessionNoGoal => 'Wala pang layunin o to-do';

  @override
  String get hubSessionGoalHint =>
      'Naglilista ang AI ng mga to-do para sa mga kumplikadong gawain. Subaybayan dito ang progreso nila';

  @override
  String get hubSessionGoal => 'Layunin';

  @override
  String get hubSessionPlanMode => 'Plan mode';

  @override
  String get hubSessionPlanSwitching => 'Nagpapalit ng plan mode';

  @override
  String get hubSessionPlanHint => 'Nagpaplano muna ang AI, nang hindi binabago ang mga file';

  @override
  String get hubSessionTodos => 'Mga to-do';

  @override
  String get hubSessionNotStarted => 'Hindi pa nasimulan';

  @override
  String get hubSessionTurnUsage => 'Paggamit bawat turn';

  @override
  String get hubSessionNoSubagents => 'Walang naipadalang subagent';

  @override
  String get hubSessionDelegations => 'Kasaysayan ng delegasyon';

  @override
  String get hubTabTrajectory => 'Trajectory';

  @override
  String get hubTabChanges => 'Mga pagbabago';

  @override
  String get hubTabFiles => 'Mga file';

  @override
  String get hubTabProgress => 'Progreso';

  @override
  String get hubTabContext => 'Context';

  @override
  String get hubTabSubagents => 'Mga subagent';

  @override
  String get hubPlugins => 'Mga plugin';

  @override
  String get hubSettingsFullAccessTitle => 'I-on ang Full access?';

  @override
  String get hubSettingsFullAccessBody =>
      'Hindi magtatanong ang AI bago magpatakbo ng mga command o magbago ng mga file.';

  @override
  String get hubSettingsStorageTitle => 'Hayaang ma-access ng AI ang mga file ng telepono?';

  @override
  String get hubSettingsStorageAllow => 'Payagan ang access';

  @override
  String get hubSettingsStorageDenied =>
      'Hindi naipagkaloob ang storage access. Payagan ang “All files access” para sa JDK-Go sa system settings, saka subukang muli.';

  @override
  String get hubSettingsRestartRequired => 'Magkakabisa pagkatapos i-restart ang engine';

  @override
  String get hubSettingsRestartNow => 'I-restart ngayon';

  @override
  String get hubSettingsInterface => 'Interface';

  @override
  String get hubSettingsChat => 'Chat';

  @override
  String get hubSettingsAutoCommands => 'Awtomatikong patakbuhin ang mga command';

  @override
  String get hubSettingsPhoneFiles => 'I-access ang mga file ng telepono';

  @override
  String get hubSettingsPhoneFilesHint => 'Nababasa at nasusulatan ng AI ang storage ng telepono';

  @override
  String get hubSettingsVisualReplies => 'Mga visual na sagot';

  @override
  String get hubSettingsVisualRepliesHint => 'Mga chart, paghahambing at mga mata-tap na opsyon';

  @override
  String get hubSettingsPhoneControl => 'Phone control';

  @override
  String get hubSettingsPhoneControlHint => 'Tingnan ang iyong screen at mag-tap para sa iyo';

  @override
  String get hubSettingsPreferences => 'Mga personal na kagustuhan';

  @override
  String get hubSettingsAppearance => 'Hitsura';

  @override
  String get hubSettingsChatTextSize => 'Laki ng teksto ng chat';

  @override
  String get hubSettingsCollapseSteps => 'I-collapse ang mga hakbang kapag tapos na';

  @override
  String get hubSettingsCollapseStepsHint => 'I-fold ang pag-iisip at mga tool call sa isang linya';

  @override
  String get hubSettingsWebPhoneLayout => 'Web phone layout';

  @override
  String get hubSettingsWebPhoneLayoutHint => 'Iakma ang JDK Web sa mga screen ng telepono';

  @override
  String get hubSettingsEngineExtensions => 'Engine at mga extension';

  @override
  String get hubSettingsEngine => 'Lokal na engine';

  @override
  String get hubSettingsProviders => 'Mga model';

  @override
  String get hubSettingsEngineSettings => 'Mga parameter ng engine';

  @override
  String get hubSettingsShareConfig => 'Ibahagi ang configuration';

  @override
  String get hubSettingsAllFeatures => 'Lahat ng feature';

  @override
  String get hubSettingsAbout => 'Tungkol dito';

  @override
  String get hubSettingsCommunity => 'Komunidad';

  @override
  String get hubSettingsLicenses => 'Mga open-source na lisensya';

  @override
  String get hubSettingsAccount => 'DeepSeek account';

  @override
  String get hubSettingsSigningIn => 'Nagsa-sign in…';

  @override
  String get hubSettingsInvalidKey => 'Di-wastong API key. Hindi masuri ang balanse';

  @override
  String get hubSettingsNoApiKey => 'Walang nakatakdang API key';

  @override
  String get hubSettingsApiKeyHint => 'Magdagdag ng API key para magsimulang makipag-chat';

  @override
  String get hubSettingsSignInAccount => 'Mag-sign in sa DeepSeek';

  @override
  String get hubSettingsOrApiKey => 'O magdagdag ng API key';

  @override
  String get hubPluginShare => 'Ibahagi ang plugin';

  @override
  String get hubPluginDetails => 'Mga detalye ng plugin';

  @override
  String get hubPluginFeatured => 'Itinampok sa dshfind';

  @override
  String get hubPluginWebOnly => 'Web lang';

  @override
  String get hubPluginStars => 'Mga star';

  @override
  String get hubPluginSource => 'Source';

  @override
  String get hubPluginInstalledVersion => 'Naka-install na bersyon';

  @override
  String get hubPluginRequiresDsh => 'Nangangailangan ng JDK';

  @override
  String get hubPluginPackageName => 'Pangalan ng package';

  @override
  String get hubPluginHomepage => 'Homepage';

  @override
  String get hubPluginRepository => 'Repository';

  @override
  String get hubPluginManageTitle => 'Pamahalaan ang plugin';

  @override
  String get hubPluginManage => 'Pamahalaan';

  @override
  String get hubPluginSafeModeInstall => 'Hindi mai-install sa Safe mode';

  @override
  String get hubPluginInstallCommand => 'Kunin ang install command';

  @override
  String get hubPluginInstallComputer => 'I-install sa computer';

  @override
  String get hubPluginInstalling => 'Ini-install…';

  @override
  String get hubPluginAllowBuilds => 'Payagan ang mga script at subukang muli';

  @override
  String get hubPluginRetryInstall => 'Subukang i-install muli';

  @override
  String get hubPluginOfficial => 'Opisyal na JDK';

  @override
  String get hubPluginNotLoaded => 'Hindi ma-load';

  @override
  String get hubPluginComponents => 'Mga component';

  @override
  String get hubPluginSafeModeRemove => 'Hindi ma-uninstall sa Safe mode';

  @override
  String get hubPluginRemoveCommand => 'Kunin ang uninstall command';

  @override
  String get hubPluginRemoveComputer => 'I-uninstall sa computer';

  @override
  String get hubPluginUninstall => 'I-uninstall';

  @override
  String hubSessionTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count turn', one: '1 turn');
    return '$_temp0';
  }

  @override
  String hubSessionTurnsRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count turn · Isinasagawa',
      one: '1 turn · Isinasagawa',
    );
    return '$_temp0';
  }

  @override
  String hubSessionStepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hakbang', one: '1 hakbang');
    return '$_temp0';
  }

  @override
  String hubSessionWaitTime(String duration) {
    return 'Naghintay ng $duration para sa iyo';
  }

  @override
  String hubSessionTurn(int turn) {
    return 'Turn $turn';
  }

  @override
  String hubSessionFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file ang nabago',
      one: '1 file ang nabago',
    );
    return '$_temp0';
  }

  @override
  String hubSessionEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-edit nang $count beses',
      one: 'Na-edit nang isang beses',
    );
    return '$_temp0';
  }

  @override
  String hubSessionTurnOf(int turn, int total) {
    return 'Turn $turn / $total';
  }

  @override
  String hubSessionCacheHit(String percent) {
    return '$percent naka-cache';
  }

  @override
  String get hubSessionBlocked => 'Naharang';

  @override
  String hubSessionBlockedReason(String reason) {
    return 'Naharang: $reason';
  }

  @override
  String hubSessionTodoSemantics(String content, String status) {
    return '$content, $status';
  }

  @override
  String get hubSettingsStorageBody =>
      'Nababasa at nababago ng AI ang iyong mga larawan, download at dokumento. Magre-restart nang isang beses ang engine.';

  @override
  String hubSettingsBalance(String amount) {
    return 'Balanse $amount';
  }

  @override
  String hubSettingsBalanceLow(String amount) {
    return 'Balanse $amount · Mababang balanse';
  }

  @override
  String hubSettingsAccountSemantics(String title, String subtitle) {
    return 'Account: $title, $subtitle';
  }

  @override
  String hubSettingsHostSemantics(String name, String status) {
    return 'Remote host: $name, $status';
  }

  @override
  String get hubSettingsApiKey => 'DeepSeek API key';

  @override
  String hubPluginBrowserFailed(String address) {
    return 'Hindi mabuksan ang browser. Bisitahin nang manu-mano ang $address';
  }

  @override
  String hubPluginYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String hubPluginUpdateTo(String version) {
    return 'I-update sa $version';
  }

  @override
  String hubPluginInstallOn(String host) {
    return 'I-install sa $host';
  }

  @override
  String hubPluginComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count component', one: '1 component');
    return '$_temp0';
  }

  @override
  String get hubPluginComponentSeparator => ',';

  @override
  String get hubGroupAi => 'AI';

  @override
  String get hubGroupCapabilities => 'Mga kakayahan';

  @override
  String get hubGroupGeneral => 'Pangkalahatan';

  @override
  String get hubGroupHosts => 'Mga host';

  @override
  String get hubGroupHelp => 'Tulong at tungkol dito';

  @override
  String get hubPersonalization => 'Pag-personalize';

  @override
  String get hubPersonalizationAboutYou => 'Tungkol sa iyo';

  @override
  String get hubPersonalizationReplies => 'Mga sagot';

  @override
  String get hubPersonalizationWorkStyle => 'Istilo ng pagtatrabaho';

  @override
  String get hubPrivacy => 'Privacy at pagbabahagi';

  @override
  String get hubPrivacySharing => 'Pagbabahagi';

  @override
  String get hubInterfaceHome => 'Home';

  @override
  String get hubInterfaceWebHint => 'Sariling web app ng JDK';

  @override
  String get hubInterfaceOpenWeb => 'Buksan ang web app';

  @override
  String get hubInterfacePhoneLayout => 'Phone layout';

  @override
  String get hubTableTint => 'Tint ng talahanayan';

  @override
  String get hubTableTintFollow => 'Tema';

  @override
  String get hubTableTintFill => 'May tint';

  @override
  String get hubTableTintNone => 'Payak';

  @override
  String get hubTableTintFillHint => 'Salitang hilera, mas madaling i-scan ang mahahabang talahanayan';

  @override
  String get hubTableTintFollowHint => 'Header tint lang, sumusunod ang katawan sa sagot';

  @override
  String get hubTableTintNoneHint => 'Mga grid line lang, ang pinakamagaan';

  @override
  String get hubAbout => 'Tungkol sa JDK-Go';

  @override
  String get hubAboutAuthor => 'Orihinal na may-akda ng JDK-Go';

  @override
  String get hubAboutBilibili => 'Profile sa Bilibili';

  @override
  String get hubAboutX => 'Profile sa X';

  @override
  String get hubAboutGithub => 'Profile sa GitHub';

  @override
  String get hubAboutNewVersion => 'May available na update';

  @override
  String get hubValueSet => 'Nakatakda';

  @override
  String get hubValueOff => 'Naka-off';

  @override
  String get hubValueOneStep => 'Isang hakbang na lang';

  @override
  String get hubValueAllowed => 'Pinapayagan';

  @override
  String get hubValueNeedsSetup => 'I-set up';

  @override
  String hubValueHosts(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count host', one: '1 host');
    return '$_temp0';
  }

  @override
  String get hubValueNoHosts => 'Wala';

  @override
  String hubValuePlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugin', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String get hubEngineStartup => 'Startup';

  @override
  String get hubThemeLightDark => 'Light at dark';

  @override
  String get hubPermissionPhone => 'Telepono';

  @override
  String get hubPermissionPhoneConfirm => 'Kumpirmasyon ng phone control';

  @override
  String get hubHardwareEnterSends => 'Magpadala gamit ang hardware Enter';

  @override
  String get hubHardwareEnterSendsHint =>
      'Kapag naka-on, naglalagay ng bagong linya ang Shift+Enter. Pinapanatili ng on-screen keyboard ang mga bagong linya; laging nagpapadala ang Ctrl/⌘+Enter.';

  @override
  String get hubQuickPanel => 'Mga shortcut sa left swipe';

  @override
  String get hubQuickPanelSwipe => 'Buksan gamit ang left swipe';

  @override
  String get hubQuickPanelSwipeHint =>
      'Mag-swipe mula kanan pakaliwa sa chat. Hindi apektado ang mga code block, talahanayan at iba pang nilalamang nag-i-scroll nang pahalang.';

  @override
  String get hubQuickPanelItems => 'Ano ang inililista nito';

  @override
  String get hubQuickPanelItemsNone => 'Walang napili: hindi ito bubuksan ng left swipe';

  @override
  String get launchScreenTitle => 'Launch screen';

  @override
  String get launchDefault => 'Default';

  @override
  String get launchCustom => 'Custom';

  @override
  String get launchFit => 'Isiksik';

  @override
  String get launchFitFill => 'Punuin';

  @override
  String get launchFitCenter => 'Gitna';

  @override
  String get launchBackground => 'Background';

  @override
  String get launchBackdropAuto => 'Auto';

  @override
  String get launchBackdropEdge => 'Mula sa larawan';

  @override
  String get launchBackdropWhite => 'Puti';

  @override
  String get launchBackdropBlack => 'Itim';

  @override
  String get launchReplace => 'Palitan ang larawan o video';

  @override
  String get launchPreview => 'Preview';

  @override
  String get launchFooter =>
      'Mga larawan at animation hanggang 8 MB, mga video hanggang 30 MB. Isang beses lang magpe-play sa cold start; i-tap para laktawan.';

  @override
  String get launchChanged => 'Nagbago ang launch screen';

  @override
  String launchChangedSize(String size) {
    return 'Nagbago ang launch screen · $size';
  }

  @override
  String get launchTooLarge => 'Lampas 8 MB ang larawan';

  @override
  String get launchOverLimit => 'Lampas 30 MB ang file';

  @override
  String get launchUnsupported => 'Gumamit ng PNG, JPEG, WebP, GIF o MP4';

  @override
  String get launchUnreadable => 'Hindi mabasa ang file na ito';

  @override
  String get launchUnavailable => 'Hindi mabuksan ang iyong mga larawan';

  @override
  String get launchBroken => 'Hindi mabasa';

  @override
  String get iconShortcutRow => 'Shortcut ng larawan';

  @override
  String get iconShortcutRowSubtitle => 'Sarili mong larawan sa home screen';

  @override
  String get iconShortcutPick => 'Pumili ng larawan';

  @override
  String get iconShortcutChange => 'Ibang larawan';

  @override
  String get iconShortcutHint => 'I-drag o i-pinch para magkasya';

  @override
  String get iconShortcutName => 'Pangalan';

  @override
  String get iconShortcutAdd => 'Idagdag sa home screen';

  @override
  String get iconShortcutNote =>
      'Hindi pinapayagan ng Android na gamitin ng app ang anumang larawan bilang icon nito, kaya nagdaragdag ito ng hiwalay na shortcut na nagbubukas ng JDK-Go. May inilalagay na maliit na badge sa sulok nito ang ilang home screen.';

  @override
  String get iconShortcutAdded => 'Naidagdag sa iyong home screen';

  @override
  String get iconShortcutConfirm => 'Kumpirmahin sa lalabas na dialog';

  @override
  String get iconShortcutNoDialog =>
      'Walang dialog? Payagan ang JDK-Go na gumawa ng mga shortcut sa home screen sa system settings.';

  @override
  String get iconShortcutSettings => 'Settings';

  @override
  String get iconShortcutUnsupported => 'Hindi tumatanggap ng mga shortcut ang home screen na ito';

  @override
  String get iconShortcutFailed => 'Hindi naidagdag. Subukang muli mamaya.';

  @override
  String get searchKwLaunchScreen => 'splash,startup,launch animation,opening screen,simula,pambungad na screen';

  @override
  String get searchKwIconShortcut => 'shortcut,custom icon,home screen picture,larawan sa home screen';

  @override
  String get liveThinking => 'Nag-iisip';

  @override
  String get liveWorking => 'Gumagawa';

  @override
  String get liveJuggling => 'Gumagana ang mga subagent';

  @override
  String get liveSweeping => 'Kino-compact ang context';

  @override
  String liveRunsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chat ang tumatakbo',
      one: '1 chat ang tumatakbo',
    );
    return '$_temp0';
  }

  @override
  String get liveChipThinking => 'Nag-iisip';

  @override
  String get liveChipWorking => 'Gumagawa';

  @override
  String get liveChipJuggling => 'Mga katulong';

  @override
  String get liveChipSweeping => 'Nag-aayos';

  @override
  String get liveChipApproval => 'Aprubahan';

  @override
  String get liveChipQuestion => 'Sumagot';

  @override
  String get liveChipDone => 'Tapos na';

  @override
  String get liveChipFailed => 'Nabigo';

  @override
  String get livePublicRunning => 'Gumagana ang JDK';

  @override
  String get livePublicWaiting => 'Naghihintay sa iyo ang JDK';

  @override
  String get livePublicDone => 'Tapos na ang JDK';

  @override
  String get livePublicFailed => 'Nagka-error ang JDK';

  @override
  String get liveSettingsTitle => 'Live activity';

  @override
  String get liveSettingsSwitch => 'Ipakita ang live activity';

  @override
  String get liveSettingsSubtitle =>
      'Habang gumagana ang JDK, naghihintay sa iyo o kumokontrol sa telepono: sa status bar chip at sa lock screen, at sa island sa mga telepono na mayroon nito';

  @override
  String get liveSettingsFooter =>
      'Android 16 Live Updates. Ipinapakita sa Xiaomi HyperOS 3.1+, OPPO / OnePlus ColorOS 16, Honor MagicOS 10 at Pixel; ang Atomic Island ng vivo at Now Bar ng Samsung ay bukas lamang sa mga app na kapartner ng gumawa.';

  @override
  String get liveUnsupported => 'Hindi pa sinusuportahan ng system ng teleponong ito ang mga live activity';

  @override
  String get liveBlockedTitle => 'Naka-off ang mga live activity para sa JDK-Go';

  @override
  String get liveBlockedText =>
      'I-on ang mga live activity para sa JDK-Go sa system settings (tinatawag itong “Show on Live Alerts” sa ilang telepono)';

  @override
  String get localeTitle => 'Wika';

  @override
  String get localeSystem => 'System';

  @override
  String get localeZh => 'Tsino';

  @override
  String get localeEn => 'English';

  @override
  String get localeFil => 'Filipino';

  @override
  String get localEnvChooseTitle => 'Saan dapat tumakbo ang JDK?';

  @override
  String get localEnvChooseMessage => 'Maaari mo itong baguhin sa Settings mamaya';

  @override
  String localEnvThisPhoneDetail(int storage, int memory) {
    return '$storage MB na storage · $memory MB na memorya';
  }

  @override
  String localEnvThisPhoneDetailShort(int memory) {
    return '$memory MB na memorya habang tumatakbo';
  }

  @override
  String localEnvLowStorage(int needed) {
    return 'Kailangan ng humigit-kumulang $needed MB na libre';
  }

  @override
  String get localEnvRemoteDetail => 'Gamitin ang JDK sa iyong computer o server';

  @override
  String get localEnvRecommended => 'Inirerekomenda';

  @override
  String get localEnvInstallTitle => 'I-install sa telepono na ito';

  @override
  String get localEnvInstallMessage => 'Patakbuhin ang JDK mismo sa telepono na ito';

  @override
  String localEnvFactStorage(int storage) {
    return 'Humigit-kumulang $storage MB ng storage';
  }

  @override
  String localEnvFactMemory(int memory) {
    return 'Humigit-kumulang $memory MB ng memorya habang tumatakbo';
  }

  @override
  String get localEnvUseRemote => 'Gumamit na lang ng remote host';

  @override
  String get localEnvNotInstalled => 'Hindi naka-install sa telepono na ito';

  @override
  String get localEnvUninstall => 'I-uninstall ang runtime';

  @override
  String get localEnvUninstallHint => 'Magbakante ng storage';

  @override
  String get localEnvUninstallTitle => 'I-uninstall ang runtime?';

  @override
  String get localEnvUninstallBody =>
      'Made-delete ang mga chat, workspace, plugin, setting, setting ng interface at skill sa telepono na ito.';

  @override
  String get localEnvUninstallConfirm => 'I-uninstall';

  @override
  String get localEnvUninstallFailed => 'Hindi ma-uninstall. Subukang muli.';

  @override
  String get localEnvPhoneNeedsRuntime => 'Available pagkatapos mag-install sa telepono na ito';

  @override
  String get localEnvSignInNeedsRuntime => 'Kailangan ang JDK sa telepono na ito';

  @override
  String get localEnvSignInInstallFirst => 'I-install ito para mag-sign in';

  @override
  String get marketSectionOfficial => 'Opisyal';

  @override
  String get marketSectionAdapted => 'Ginawa para sa JDK-Go';

  @override
  String get marketSectionAll => 'Lahat';

  @override
  String get marketSectionLoading => 'Nilo-load…';

  @override
  String get marketSectionFailed => 'Hindi na-load ang opisyal na katalogo';

  @override
  String get marketSectionEmpty => 'Wala pa';

  @override
  String get marketTierOfficial => 'Opisyal';

  @override
  String get marketTierAdapted => 'Ginawa para sa JDK-Go';

  @override
  String get marketRiskMedium => 'Katamtamang panganib';

  @override
  String get marketRiskHigh => 'Mataas na panganib';

  @override
  String get marketFlagInstallScripts => 'Nagpapatakbo ng mga install script';

  @override
  String get marketFlagInstallScriptsBody =>
      'Pinapatakbo ang sariling mga script ng package habang nag-i-install (preinstall, install o postinstall)';

  @override
  String get marketFlagNativeCode => 'Native code';

  @override
  String get marketFlagNativeCodeBody =>
      'May compiled na native code (.node, binding.gyp o mga binary) na hindi mababasa bilang source';

  @override
  String get marketFlagShell => 'Nagpapatakbo ng mga command';

  @override
  String get marketFlagShellBody => 'Nagpapatakbo ng mga system command ang code nito (child_process)';

  @override
  String get marketFlagNetwork => 'Access sa network';

  @override
  String get marketFlagNetworkBody => 'Gumagawa ng mga network request ang code nito (fetch, http, WebSocket)';

  @override
  String get marketFlagFilesystem => 'Sumusulat sa labas ng workspace';

  @override
  String get marketFlagFilesystemBody => 'Sumusulat sa mga path sa labas ng workspace';

  @override
  String get marketFlagObfuscated => 'Mahirap suriin';

  @override
  String get marketFlagObfuscatedBody =>
      'May malalaking minified o obfuscated na file; mahirap malaman kung ano ang ginagawa ng mga ito';

  @override
  String get marketFlagNotAdapted => 'Hindi ginawa para sa JDK-Go';

  @override
  String get marketFlagNotAdaptedBody =>
      'Walang idineklarang native protocol ng JDK-Go, kaya walang native na screen sa app';

  @override
  String get marketFlagOtherBody => 'Isa pang katangiang iniulat ng mga awtomatikong pagsusuri';

  @override
  String get marketChecksTitle => 'Mga awtomatikong pagsusuri';

  @override
  String get marketChecksClean => 'Walang nakitang mapanganib na katangian';

  @override
  String get marketChecksNote =>
      'Mga katangiang nakita ng mga awtomatikong pagsusuri; hindi nangangahulugang nakakapinsala ang plugin';

  @override
  String marketCheckedOn(String date) {
    return 'Sinuri noong $date';
  }

  @override
  String marketScreenshot(int index) {
    return 'Screenshot $index';
  }

  @override
  String marketRiskConfirmTitle(String name) {
    return 'May mga mapanganib na katangian ang $name';
  }

  @override
  String get marketRiskConfirmAction => 'I-install pa rin';

  @override
  String get marketPinnedVersion => 'Naka-pin na bersyon';

  @override
  String get marketRequiresApp => 'Nangangailangan ng JDK-Go';

  @override
  String marketNeedsApp(String version) {
    return 'Kailangan ng JDK-Go $version o mas bago';
  }

  @override
  String get marketUpdateAvailable => 'May available na update';

  @override
  String get marketBlockedTitle => 'Binawi ang bersyong ito';

  @override
  String marketBlockedMessage(String version) {
    return 'Binawi sa plugin market ang naka-install na $version. Inirerekomendang i-uninstall ito.';
  }

  @override
  String get marketBlockedRow => 'Binawing bersyon: inirerekomendang i-uninstall';

  @override
  String get marketBlockedBadge => 'Binawi';

  @override
  String get marketVerifying => 'Sinusuri ang bersyon…';

  @override
  String get marketMismatchTitle => 'Nabigo ang pagsusuri ng bersyon';

  @override
  String marketMismatchMessage(String version) {
    return 'Ang $version sa npm ay hindi ang package na sinuri ng plugin market. Walang na-install.';
  }

  @override
  String get marketSubmit => 'Magsumite ng plugin';

  @override
  String get marketSubmitHint => 'Nasa GitHub; ililista kapag pumasa sa mga awtomatikong pagsusuri';

  @override
  String marketLinkNotFound(String name) {
    return 'Wala sa plugin market ang $name';
  }

  @override
  String get marketVerificationUnavailableTitle => 'Hindi ma-verify ang bersyon';

  @override
  String get marketVerificationUnavailableBody =>
      'Hindi nagbalik ng integrity information ang npm. Hindi pa nagsisimula ang pag-install. Suriin ang iyong koneksyon at subukang muli.';

  @override
  String marketCombinedCount(int count) {
    return '$count plugin';
  }

  @override
  String get mediaGenerateTile => 'Lumikha';

  @override
  String get mediaAiGenerated => 'Binuo ng AI';

  @override
  String mediaCostEstimate(String amount) {
    return 'Humigit-kumulang $amount';
  }

  @override
  String mediaSavedCount(int count) {
    return 'Nai-save ang $count sa Photos';
  }

  @override
  String get mediaRegenerate => 'Buuin muli';

  @override
  String get mediaCopyPrompt => 'Kopyahin ang prompt';

  @override
  String get mediaFileGone => 'Wala na ang file';

  @override
  String get mediaKindImage => 'Larawan';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaTitleImage => 'Bagong larawan';

  @override
  String get mediaTitleVideo => 'Bagong video';

  @override
  String get mediaOpenElsewhere => 'Buksan sa ibang app';

  @override
  String get mediaShowInFiles => 'Ipakita sa mga file';

  @override
  String get mediaGenerating => 'Bumubuo';

  @override
  String mediaGeneratingProgress(String progress) {
    return 'Bumubuo · $progress';
  }

  @override
  String get mediaCancelled => 'Nakansela';

  @override
  String get mediaNotGenerated => 'Hindi nalikha';

  @override
  String mediaPartial(int done, int total) {
    return '$done sa $total';
  }

  @override
  String mediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count larawan', one: '1 larawan');
    return '$_temp0';
  }

  @override
  String mediaSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String mediaImageOf(int index, int count) {
    return 'Larawan $index sa $count';
  }

  @override
  String mediaPageOf(int index, int count) {
    return '$index / $count';
  }

  @override
  String get mediaErrorPolicyInput => 'Hindi pumasa sa content review ang paglalarawan';

  @override
  String get mediaErrorPolicyOutput => 'Hindi pumasa sa content review ang resulta';

  @override
  String get mediaErrorAuth => 'Hindi awtorisado ang serbisyo';

  @override
  String get mediaErrorBalance => 'Kulang ang balanse';

  @override
  String get mediaErrorQuota => 'Naubos na ang limitasyon ngayon';

  @override
  String get mediaErrorUnavailable => 'Hindi available ang serbisyo sa ngayon';

  @override
  String get mediaErrorExpired => 'Nag-expire ang resulta';

  @override
  String get mediaErrorGeneric => 'Hindi nalikha';

  @override
  String get mediaVary => 'Baryasyon';

  @override
  String get mediaEdit => 'I-edit';

  @override
  String get mediaRevise => 'Rebisahin';

  @override
  String get mediaUpscale => 'I-upscale';

  @override
  String get mediaMakeVideo => 'Gumawa ng video';

  @override
  String get mediaDetailModel => 'Model';

  @override
  String get mediaDetailSize => 'Laki';

  @override
  String get mediaDetailCost => 'Gastos';

  @override
  String get mediaDetailProvenance => 'Pinagmulan';

  @override
  String get mediaDetailFile => 'File';

  @override
  String mediaOriginalPrompt(String text) {
    return 'Orihinal: $text';
  }

  @override
  String get mediaProvenanceC2pa => 'C2PA';

  @override
  String get mediaProvenanceImplicit => 'Naka-embed';

  @override
  String get mediaProvenanceVisible => 'Nakikitang marka';

  @override
  String get mediaModeExit => 'Umalis sa create mode';

  @override
  String mediaModeLabel(String summary) {
    return 'Mga setting ng paglikha: $summary';
  }

  @override
  String get mediaParamModel => 'Model';

  @override
  String get mediaParamAspect => 'Aspect';

  @override
  String get mediaParamCount => 'Bilang';

  @override
  String get mediaParamQuality => 'Kalidad';

  @override
  String get mediaParamDuration => 'Haba';

  @override
  String get mediaQualityAuto => 'Auto';

  @override
  String get mediaQualityStandard => 'Standard';

  @override
  String get mediaQualityHigh => 'HD';

  @override
  String get mediaQuality4k => '4K';

  @override
  String get mediaQualityLevelLow => 'Mababa';

  @override
  String get mediaQualityLevelMedium => 'Katamtaman';

  @override
  String get mediaQualityLevelHigh => 'Mataas';

  @override
  String get mediaModelPick => 'Pumili';

  @override
  String get mediaPickModelFirst => 'Pumili muna ng model';

  @override
  String mediaPricePerImage(String price) {
    return '$price / larawan';
  }

  @override
  String mediaPricePerSecond(String price) {
    return '$price / s';
  }

  @override
  String get mediaManageModels => 'Pamahalaan';

  @override
  String get mediaHintImage => 'Ilarawan ang larawan…';

  @override
  String get mediaHintVideo => 'Ilarawan ang eksena at ang kuha…';

  @override
  String get mediaHintEdit => 'Paano ito dapat magbago…';

  @override
  String get mediaFirstFrame => 'Una';

  @override
  String get mediaLastFrame => 'Huli';

  @override
  String get mediaNoLastFrame => 'Walang tinatanggap na huling frame ang model na ito';

  @override
  String get mediaNoRefs => 'Walang tinatanggap na reference na larawan ang model na ito';

  @override
  String mediaRefLimit(int count) {
    return 'Hanggang $count reference na larawan';
  }

  @override
  String get mediaNoDescription => 'Ilarawan muna ito';

  @override
  String get mediaDescriptionTooLong => 'Masyadong mahaba para mabuo. Paikliin ang paglalarawan';

  @override
  String get mediaInstallTitle => 'Mga larawan at video';

  @override
  String get mediaInstallBody => 'Wala pang plugin para sa larawan at video ang host na ito';

  @override
  String get mediaInstallAction => 'I-install sa host na ito';

  @override
  String get mediaUnavailableTitle => 'Hindi available ang generation mode';

  @override
  String get mediaUnavailableBody =>
      'Hindi tugma ang plugin ng larawan at video sa host na ito. Maaari mo pa ring ilarawan sa chat ang gusto mo.';

  @override
  String get mediaUnavailableAction => 'Pamahalaan ang mga plugin';

  @override
  String get mediaSettingsTitle => 'Mga larawan at video';

  @override
  String get searchKwMediaGeneration =>
      'image generation,text to image,video generation,AI art,generate images,generate video,paglikha ng larawan,paglikha ng video';

  @override
  String get mediaSettingsDefaults => 'Mga default';

  @override
  String get mediaSettingsLegacyDefault => 'Mas lumang pangkalahatang default';

  @override
  String get mediaSettingsLegacyDefaultHint =>
      'Ang 0.2.x na setting; ginagamit kapag walang sariling default ang isang uri';

  @override
  String get mediaSettingsLegacyDefaultStale =>
      'Hindi available ang serbisyo nito; i-clear ito para hindi mabigo ang paglikha';

  @override
  String get mediaSettingsLegacyDefaultClear => 'I-clear ang mas lumang pangkalahatang default';

  @override
  String get mediaSettingsDefaultModel => 'Default na model';

  @override
  String get mediaSettingsDefaultFooterLegacy =>
      'Isa lang ang default na model ng mas lumang plugin; i-update ito para itakda nang hiwalay ang mga larawan at video.';

  @override
  String get mediaSettingsDefaultsFooter =>
      'Pumili ng default na model para sa mga larawan at para sa video; iwanan sa Auto para gamitin ang unang available.';

  @override
  String get mediaSettingsNoVideoModels => 'Wala pang mga video model sa katalogo ng host na ito';

  @override
  String get mediaSettingsServices => 'Mga serbisyo';

  @override
  String get mediaSettingsAddService => 'Magdagdag ng serbisyo';

  @override
  String get mediaSettingsAddServiceHint =>
      'Magsimula sa isang provider preset; punong-puno na ang endpoint, protocol at mga model';

  @override
  String mediaSettingsServiceLimit(int count) {
    return 'Hanggang $count serbisyo';
  }

  @override
  String get mediaSettingsNoServices =>
      'Wala pang serbisyo. Magdagdag ng provider para magsimulang gumawa ng mga larawan o video.';

  @override
  String get mediaSettingsNoModels => 'Walang napiling model';

  @override
  String get mediaSettingsKeyMissing => 'Walang API key';

  @override
  String get mediaSettingsCatalogMissing =>
      'Walang iniaalok na katalogo ng model ang plugin sa host na ito. Maaari pa ring i-edit ang mga umiiral na serbisyo, ngunit walang maidaragdag at wala pang mapipiling default.';

  @override
  String get mediaSettingsCatalogBroken =>
      'Hindi mabasa ang katalogo ng model (maaaring hindi tugmang bersyon). Maaari pa ring i-edit ang mga umiiral na serbisyo, ngunit walang maidaragdag at wala pang mapipiling default.';

  @override
  String get mediaSettingsCatalogEmpty =>
      'Wala pang mga model ang katalogo ng model. Maaari pa ring i-edit ang mga umiiral na serbisyo, ngunit walang maidaragdag at wala pang mapipiling default.';

  @override
  String get mediaSettingsNoPresets => 'Wala pang serbisyong maidaragdag mula sa katalogong ito.';

  @override
  String get mediaSettingsLimits => 'Mga limitasyon ng request';

  @override
  String get mediaSettingsLimitsHint =>
      'Nililimitahan ang mga larawan at byte bawat request; ang mga default ay ang hard limit ng plugin';

  @override
  String get mediaSettingsMaxImages => 'Mga larawan bawat request';

  @override
  String get mediaSettingsMaxImageBytes => 'Max na byte bawat orihinal';

  @override
  String get mediaSettingsMaxResponseBytes => 'Max na byte ng tugon ng provider';

  @override
  String get mediaSettingsMaxTotalImageBytes => 'Max na byte ng larawan bawat request';

  @override
  String get mediaSettingsMaxVideoBytes => 'Max na byte ng video';

  @override
  String get mediaSettingsBudget => 'Proteksyon sa gastos';

  @override
  String get mediaSettingsDailyBudget => 'Pang-araw-araw na badyet (CNY)';

  @override
  String get mediaSettingsDailyBudgetHint =>
      'Nagre-reset sa petsa ng Shanghai; humihinto ang paglikha kapag naubos na ito';

  @override
  String get mediaSettingsUnknownPriceHold => 'Hold bawat request kapag hindi alam ang presyo (CNY)';

  @override
  String get mediaSettingsUnknownPriceHoldHint =>
      'Nakareserba bawat request; hindi limitasyong ginagamit ng provider sa pagsingil';

  @override
  String get mediaSettingsApiKey => 'API key';

  @override
  String get mediaSettingsReuseKey => 'Gamitin muli ang key';

  @override
  String get mediaSettingsReuseKeyHint =>
      'Maaaring magbahagi ng isang API key ang mga larawan at video mula sa isang provider; hindi na kailangang ilagay ito muli.';

  @override
  String get mediaSettingsReuseKeyNone => 'Wala pang ibang serbisyo mula sa provider na ito.';

  @override
  String get mediaSettingsReuseKeyShared => 'Nakabahagi';

  @override
  String get mediaSettingsModels => 'Mga model';

  @override
  String get mediaSettingsModelsEmpty => 'Walang mga model sa katalogo para sa protocol na ito';

  @override
  String get mediaSettingsModelKeepOne => 'Magtira ng kahit isang model';

  @override
  String get mediaSettingsModelMissing => 'Wala sa katalogo';

  @override
  String get mediaSettingsAdvanced => 'Advanced';

  @override
  String get mediaSettingsBaseUrl => 'API base URL';

  @override
  String get mediaSettingsBaseUrlInvalid => 'Dapat magsimula sa https:// ang address';

  @override
  String get mediaSettingsProvider => 'Provider id';

  @override
  String get mediaSettingsKeyRef => 'Pangalan ng kredensyal';

  @override
  String get mediaSettingsKeyRefInvalid => 'Mga letra, digit at underscore lang ang gamitin';

  @override
  String get mediaSettingsResponseFormat => 'Format ng tugon';

  @override
  String get mediaSettingsResponseFormatAuto => 'Ayon sa protocol';

  @override
  String get mediaSettingsServiceId => 'Service ID';

  @override
  String get mediaSettingsServiceGone => 'Wala na ang serbisyong ito';

  @override
  String get mediaSettingsServiceGoneBody => 'Maaaring naalis ito sa ibang lugar. Bumalik para idagdag itong muli.';

  @override
  String get mediaSettingsDelete => 'Burahin ang serbisyo';

  @override
  String mediaSettingsDeleteTitle(String name) {
    return 'Burahin ang “$name”?';
  }

  @override
  String get mediaSettingsDeleteBody =>
      'Ang entry lang ng serbisyo sa host na ito ang aalisin; pananatilihin ang API key. Ki-clear din ang mga default na tumuturo rito.';

  @override
  String get mediaSettingsNoImageModels => 'Wala pang mga image model ang katalogo';

  @override
  String get mediaSettingsNoAvailableService => 'Wala pang handang serbisyo (magdagdag ng isa at ilagay ang key nito)';

  @override
  String get mediaSettingsNoImageService =>
      'Wala pang handang serbisyo ng larawan (magdagdag ng isa at ilagay ang key nito)';

  @override
  String get mediaSettingsNoVideoService =>
      'Wala pang handang serbisyo ng video (magdagdag ng isa at ilagay ang key nito)';

  @override
  String get mediaSettingsKeyExternal => 'Pinamamahalaan ng ibang setting; tinutukoy lang dito';

  @override
  String get mediaSettingsEnabledHint => 'Pinapatay ang serbisyong ito para sa paglikha';

  @override
  String get mediaConfigKeySaved => 'Na-save · hindi pa na-verify';

  @override
  String get mediaConfigKeyUnknown => 'Hindi available ang katayuan';

  @override
  String get mediaConfigKeyNote =>
      'Ang host ang nag-uulat ng presensya ng key. Hindi nagve-verify ng authentication o access sa model ang pag-save ng key.';

  @override
  String mediaConfigConsumers(String services) {
    return 'Mga media service na gumagamit ng key na ito: $services. Maaapektuhan silang lahat kapag binago o inalis ito; maaari rin itong gamitin ng ibang integration ng host.';
  }

  @override
  String get mediaConfigCheck => 'Suriin ang naka-save na configuration';

  @override
  String get mediaConfigCheckNote =>
      'Lokal na snapshot lang; walang kahilingan sa provider o singil sa pagbuo. Hindi nito vine-verify ang key, koneksyon, balanse, access sa model o rehiyon. Ang host pa rin ang awtoridad sa mga tinatanggap na setting.';

  @override
  String get mediaConfigCheckReady => 'Walang nakitang lokal na isyu sa configuration';

  @override
  String get mediaConfigCheckMissingKey => 'Wala pang iniulat na naka-save na key ang host.';

  @override
  String get mediaConfigCheckModels =>
      'Walang napiling model, o may mga napiling model na nawawala o iba ang protocol.';

  @override
  String get mediaConfigCheckDisabled => 'Naka-off ang serbisyong ito.';

  @override
  String get mediaConfigUrlInvalid =>
      'Maglagay ng HTTPS API root na may host, nang walang kredensyal, query, fragment o whitespace.';

  @override
  String get mediaConfigUrlEndpoint =>
      'Mukhang request endpoint ito. Ilagay na lang ang API root; idinadagdag ng host ang request path.';

  @override
  String get mediaConfigUrlRoot => 'Origin lang ang kailangan ng protocol na ito (https://host), nang walang API path.';

  @override
  String get mediaConfigUrlHint =>
      'Ilagay ang API root, hindi ang generation endpoint. Pinananatili ng mga OpenAI-compatible na root ang kanilang prefix (halimbawa /v1).';

  @override
  String get mediaConfigPreview => 'Gumawa ng preview ng request';

  @override
  String get mediaConfigPreviewNote =>
      'Generation/create request lang; maaaring gumamit ng ibang path ang mga edit at status request. Hindi patunay ng koneksyon o pagtanggap ng host ang preview.';

  @override
  String get mediaConfigPreviewUnavailable => 'Hindi available ang request path sa katalogo ng host na ito.';

  @override
  String get mediaConfigTargetTitle => 'Gamitin muli ang key sa ibang target?';

  @override
  String mediaConfigTargetBody(String before, String after) {
    return 'Magbabago ang target mula $before patungong $after. Maaaring ipadala ng mga susunod na request ang tinutukoy na key sa bagong target. Magpatuloy lang kung pinagkakatiwalaan mo ito. Vine-validate pa rin ng host ang pagbabago.';
  }

  @override
  String get mediaConfigTargetConfirm => 'Pagkatiwalaan ang target at magpatuloy';

  @override
  String get mediaVideoLoading => 'Nilo-load ang video…';

  @override
  String get mediaVideoCannotPlay => 'Hindi mapapanood ang video na ito rito. Subukang muli o buksan sa ibang app.';

  @override
  String get mediaVideoPlay => 'I-play';

  @override
  String get mediaVideoPause => 'I-pause';

  @override
  String get mediaVideoSaveFailed => 'Hindi ma-save ang video. Subukang muli.';

  @override
  String get mediaImageLoading => 'Nilo-load ang larawan';

  @override
  String get mediaImageReload => 'I-reload ang larawan';

  @override
  String get mediaImageReloadHint => 'Binabasa muli ang file; hindi muling bubuo at walang bayad sa pagbuo';

  @override
  String get mediaVideoNoPoster => 'I-tap para i-play ang video';

  @override
  String mediaSavedFilesCount(int count) {
    return 'Nai-save ang $count file sa gallery';
  }

  @override
  String get nearbyThisChat => 'Ang chat na ito';

  @override
  String get nearbyPermissionTitle => 'Mga pahintulot para sa chat na ito';

  @override
  String nearbyNewChatDefault(String name) {
    return 'Mga bagong chat: $name';
  }

  @override
  String get nearbySetAsDefault => 'Gamitin para sa mga bagong chat';

  @override
  String get nearbyManageModels => 'Pamahalaan ang mga model';

  @override
  String nearbyPermissionPill(String name) {
    return 'Mga pahintulot para sa chat na ito: $name';
  }

  @override
  String get nearbyChange => 'Baguhin';

  @override
  String get performanceTitle => 'Performance';

  @override
  String get performanceAuto => 'Auto';

  @override
  String get performanceFull => 'Buo';

  @override
  String get performanceLight => 'Magaan';

  @override
  String get performanceAutoHint => 'Ayusin ang mga default na epekto para sa device na ito';

  @override
  String get performanceFullHint => 'Panatilihin ang blur at animation';

  @override
  String get performanceLightHint => 'Bawasan ang patuloy na mga epekto at paggamit ng resource';

  @override
  String get performanceChoiceHint => 'Nauuna ang iyong mga pagpili sa pet at engine';

  @override
  String get performanceCooling => 'Binabawasan ang mga epekto hanggang lumamig ang device';

  @override
  String get performanceEffects => 'Mga epekto ng interface';

  @override
  String get performanceBlur => 'Glass blur';

  @override
  String get performanceAnimations => 'Animation ng interface';

  @override
  String get performanceSystemMotion => 'Sumusunod din sa setting ng system na alisin ang mga animation';

  @override
  String get performanceFluid => 'Maayos na galaw';

  @override
  String get performanceFluidHint =>
      'Nababanat na pagbitaw, malambot na ningning sa ilalim ng daliri, mga card na nagbubukas bilang mga pahina. Halos walang konsumo ng baterya';

  @override
  String get performanceFollowMode => 'Sundin ang performance mode';

  @override
  String get performanceRemoteHint => 'Kumonekta sa computer o server para bawasan ang trabaho ng telepono';

  @override
  String get performanceRefresh => 'Refresh rate';

  @override
  String get performanceRefreshMax => 'Max';

  @override
  String get performanceRefreshSystem => 'System';

  @override
  String get performanceRefreshHint =>
      'Auto: pinakamabilis habang gumuguhit, ibinabalik kapag walang galaw; System: ang system ang magpapasya.';

  @override
  String get searchKwRefreshRate => 'refresh rate mataas na refresh 120Hz 90Hz makinis';

  @override
  String get petActionSending => 'Ipinapadala…';

  @override
  String get petActionTargetChanged => 'Nagbago ang host. Buksan muli ang Quick ask; napanatili ang iyong teksto.';

  @override
  String get petActionSendFailed => 'Hindi naipadala. Napanatili ang iyong teksto; subukang muli.';

  @override
  String get petActionBusy => 'Abala ang chat na ito. Pumili ng Bagong chat.';

  @override
  String get petActionVoiceMissing => 'I-download muna ang offline na voice model sa app.';

  @override
  String get petActionVoiceTitle => 'Boses para sa Quick ask';

  @override
  String get petActionVoiceReturn => 'Bumalik sa pet';

  @override
  String get petActionVoiceStop => 'Tapusin ang pag-record';

  @override
  String get petActionVoiceStart => 'Mag-record';

  @override
  String get phoneDiagnosticsCollecting => 'Kinokolekta…';

  @override
  String get phoneDiagnosticsPacking => 'Ina-pack…';

  @override
  String get phoneDiagnosticsSharing => 'Binubuksan ang share sheet…';

  @override
  String get phoneDiagnosticsSaving => 'Sine-save sa Downloads…';

  @override
  String get phoneDiagnosticsShare => 'Ibahagi ang diagnostics bundle';

  @override
  String get phoneDiagnosticsShareHint => 'I-attach sa bug report';

  @override
  String get phoneDiagnosticsSave => 'I-save sa Downloads';

  @override
  String get phoneDiagnosticsSaveHint => 'I-save sa Downloads/DSH-Go';

  @override
  String get phoneDiagnosticsNote =>
      'Kasama ang mga bersyon, impormasyon ng device, mga log at ang pinakabagong crash. Walang API key o token.';

  @override
  String get phoneDiagnosticsExport => 'I-export ang diagnostics bundle';

  @override
  String get phoneSafeMode => 'Safe mode';

  @override
  String get phoneEngineStartingSafeEllipsis => 'Nagsisimula sa Safe mode…';

  @override
  String get phoneEngineStartingEllipsis => 'Nagsisimula…';

  @override
  String get phoneEngineTidyingFilesEllipsis => 'Inaayos ang mga file ng plugin…';

  @override
  String get phoneEngineStoppingEllipsis => 'Humihinto…';

  @override
  String get phoneEngineStoppedNextSafe => 'Huminto · Susunod na simula sa Safe mode';

  @override
  String get phoneEngineInstallingRuntime => 'Ini-install ang runtime…';

  @override
  String get phoneEngineRuntimeNotInstalled => 'Hindi naka-install ang runtime';

  @override
  String get phoneEngineErrorSeeLogs => 'Error sa engine. Tingnan ang mga log para sa detalye.';

  @override
  String get phoneEngineTitle => 'Lokal na engine';

  @override
  String get phoneEngineLocal => 'Engine ng telepono na ito';

  @override
  String get phoneEngineLogs => 'Mga log';

  @override
  String get phoneEngineAutoStart => 'Simulan kapag nagbukas ang JDK-Go';

  @override
  String get phoneEngineKeepAlive => 'Pagtakbo sa background';

  @override
  String get phoneEngineKeepAliveHint => 'Pigilan ang Android na ihinto ang engine';

  @override
  String get phoneEngineDiagnostics => 'Diagnostics';

  @override
  String get phoneEngineDiagnosticsHint => 'Impormasyon ng runtime at mga bug report';

  @override
  String get phoneEngineRuntime => 'Runtime';

  @override
  String get phoneEngineArchitecture => 'Arkitektura';

  @override
  String get phoneEngineStopTitle => 'Ihinto ang engine?';

  @override
  String get phoneEngineStopBody => 'Puputulin ang mga aktibong chat. Maaari mo itong simulan muli anumang oras.';

  @override
  String get phoneEngineInstallRuntime => 'I-install ang runtime';

  @override
  String get phoneEngineStartAgain => 'Simulan muli';

  @override
  String get phoneEngineStart => 'Simulan';

  @override
  String get phoneEngineRestart => 'I-restart';

  @override
  String get phoneEngineResetFailed => 'Hindi ma-reset';

  @override
  String get phoneEngineReset => 'I-reset ang runtime';

  @override
  String get phoneEngineResetHint => 'Burahin ang mga chat at file, saka i-extract muli';

  @override
  String get phoneEngineResetTitle => 'I-reset ang runtime?';

  @override
  String get phoneResetAlsoDeletes =>
      'Mabubura rin ang anumang iba pa sa home folder (/root), kasama ang mga file sa iyong mga workspace, AGENTS.md at data na iniimbak mismo ng mga plugin, tulad ng mga alaala.';

  @override
  String get phoneEngineKeepUiSkills => 'Panatilihin ang mga setting ng interface at mga skill';

  @override
  String get phoneEngineKeepPluginsSettings => 'Panatilihin ang mga naka-install na plugin at setting';

  @override
  String get phoneEngineDeleteReset => 'Burahin at i-reset';

  @override
  String get phoneEngineNotInstalled => 'Hindi naka-install';

  @override
  String get phoneEngineInstalling => 'Ini-install';

  @override
  String get phoneEngineStoppedSafe => 'Huminto · Safe mode';

  @override
  String get phoneEngineStartingSafe => 'Nagsisimula sa Safe mode';

  @override
  String get phoneEngineStarting => 'Nagsisimula';

  @override
  String get phoneEngineTidyingFiles => 'Inaayos ang mga file ng plugin';

  @override
  String get phoneEngineRunningProbation => 'Tumatakbo · Trial';

  @override
  String get phoneEngineStartupFailed => 'Hindi masimulan';

  @override
  String get phoneEngineCrashed => 'Nag-crash';

  @override
  String get phoneEngineKilled => 'Itinigil ng Android';

  @override
  String get phoneEngineError => 'Nagkaproblema';

  @override
  String get phoneEngineRuntimeCorrupt => 'Sira ang kasamang runtime. I-install muli ang JDK.';

  @override
  String get phoneEngineExited => 'Biglang huminto ang engine';

  @override
  String get phoneEngineRuntimeMissing => 'Hindi pa naka-install ang runtime';

  @override
  String get phoneEngineSafeUnsupported => 'Hindi sinusuportahan ng runtime na ito ang Safe mode. I-update ang JDK.';

  @override
  String get phoneEngineRuntimeIncomplete => 'Hindi kumpleto ang kasamang runtime. I-install muli ang JDK.';

  @override
  String get phoneLogEmpty => 'Wala pang log';

  @override
  String get phoneLogShareTitle => 'Mga log ng JDK engine';

  @override
  String get phoneLogCopyAll => 'Kopyahin lahat';

  @override
  String get phoneBackgroundAllow => 'Payagan ang access';

  @override
  String get phoneToolScreen => 'Basahin ang screen';

  @override
  String get phoneToolCollect => 'Mag-scroll at mangolekta';

  @override
  String get phoneToolTap => 'Tap';

  @override
  String get phoneToolType => 'Type';

  @override
  String get phoneToolScroll => 'Swipe';

  @override
  String get phoneToolKey => 'Pindutin ang key';

  @override
  String get phoneToolTapCoordinates => 'Tap sa mga coordinate';

  @override
  String get phoneToolHandoff => 'Ibalik sa iyo';

  @override
  String get phoneToolOpenApp => 'Buksan ang app';

  @override
  String get phoneToolListApps => 'Tingnan ang mga app';

  @override
  String get phoneToolIntent => 'Aksyon ng system';

  @override
  String get phoneToolNotify => 'Magpadala ng notification';

  @override
  String get phoneToolClipboard => 'Clipboard';

  @override
  String get phoneToolAction => 'Aksyon';

  @override
  String get phoneDecisionContinued => 'Nagpatuloy ka';

  @override
  String get phoneDecisionDone => 'Naisagawa';

  @override
  String get phoneDecisionAllowed => 'Pinayagan mo ito';

  @override
  String get phoneDecisionPauseExpired => 'Masyadong natagalan ang pag-pause';

  @override
  String get phoneDecisionBlocked => 'Naharang';

  @override
  String get phoneDecisionTimeout => 'Nag-time out';

  @override
  String get phoneDecisionUnavailable => 'Hindi available';

  @override
  String get phoneDecisionScreenChanged => 'Nagbago ang screen';

  @override
  String get phoneDecisionFailed => 'Hindi gumana';

  @override
  String get phoneActionLogTitle => 'Action log';

  @override
  String get phoneActionLogSubtitle => 'Nagtatala ng mga aksyon, hindi kailanman ng nilalaman ng screen';

  @override
  String get phoneActionLogRefresh => 'I-refresh';

  @override
  String get phoneActionLogEmpty => 'Wala pang aksyon';

  @override
  String get phoneActionLogEmptyHint => 'Lalabas dito ang bawat hakbang ng JDK sa telepono mo';

  @override
  String get phoneAppRuleDeny => 'Hands off';

  @override
  String get phoneAppRuleConfirm => 'Bawat hakbang';

  @override
  String get phoneAppRuleNormal => 'Gaya ng dati';

  @override
  String get phoneAppRuleDenyHint => 'Walang pagbasa o pag-tap. Default para sa mga app ng bangko at pagbabayad.';

  @override
  String get phoneAppRuleConfirmHint => 'Makakabasa. Nagtatanong bago mag-tap o mag-type.';

  @override
  String get phoneAppRuleNormalHint => 'Nagtatanong lang bago ang mga sensitibong aksyon, tulad ng pagpapadala';

  @override
  String get phoneAppRulesTitle => 'Mga patakaran ng app';

  @override
  String get phoneAppRulesSubtitle =>
      'Gumagana gaya ng dati ang mga app na wala sa listahan. Kailangan pa rin ng pag-apruba ang mga sensitibong aksyon.';

  @override
  String get phoneAppRulesUnavailable => 'Hindi mabasa ang mga patakaran ng app';

  @override
  String get phoneTryLater => 'Subukang muli mamaya';

  @override
  String get phoneAppRulesChanged => 'Gaya ng dati · Binago mo';

  @override
  String get phoneAppRulesAdd => 'Magdagdag ng app';

  @override
  String get phoneAppRulesAddHint => 'Magdagdag ayon sa package name';

  @override
  String get phoneSensitiveActionsNote =>
      'Ikaw ang bahala sa mga password, verification code, pagbabayad at system settings';

  @override
  String get phoneAppRulesSaveFailed => 'Hindi na-save. Subukang muli mamaya.';

  @override
  String get phoneAppRulesAcceptRisk => 'Baguhin pa rin';

  @override
  String get phoneAppRulesPackage => 'Package name';

  @override
  String get phoneAppRulesPackageHint => 'Hanapin ito sa Settings → Apps → App info';

  @override
  String get phoneDndRequiresAndroid => 'Nangangailangan ng Android 14 o mas bago';

  @override
  String get phoneDndHiddenScreen => 'Gumagana sa nakatagong screen';

  @override
  String get phoneNotReadyYet => 'Hindi pa handa';

  @override
  String get phoneActionFailedLater => 'Hindi makumpleto. Subukang muli mamaya.';

  @override
  String get phoneDndDisabled => 'Naka-off ang non-disruptive mode';

  @override
  String get phoneDndEnabled => 'Naka-on ang non-disruptive mode';

  @override
  String get phoneDndShizukuPermissionFailed =>
      'Hindi naipagkaloob ang pahintulot. Payagan ang JDK-Go sa “Application management” ng Shizuku.';

  @override
  String get phoneDndPairedConnect => 'Naka-pair. I-tap ang “Connect”.';

  @override
  String get phoneDndTitle => 'Non-disruptive mode';

  @override
  String get phoneDndSubtitle => 'Gumagana sa nakatagong screen habang ginagamit mo ang telepono';

  @override
  String get phoneDndUnsupported =>
      'Kailangan ng telepono na ito ang Android 14 o mas bago para magamit ang feature na ito.';

  @override
  String get phoneDndRequirements => 'Mga kinakailangan';

  @override
  String get phoneDndKeepUnlocked => 'Panatilihing bukas at naka-unlock ang screen.';

  @override
  String get phoneDndReactivate => 'I-activate muli pagkatapos i-restart ang telepono mo.';

  @override
  String get phoneDndKeepDebugging => 'Sa Shizuku o Direct ADB, manatili sa Wi-Fi na naka-on ang Wireless debugging.';

  @override
  String get phoneReady => 'Handa na';

  @override
  String get phoneDndDirectAdb => 'Direct ADB';

  @override
  String get phoneDndChannels => 'Channel';

  @override
  String get phoneDndShizukuFor => 'Mga telepono na may Shizuku app';

  @override
  String get phoneDndSuiFor => 'Sui module sa Magisk o KernelSU';

  @override
  String get phoneDndRootFor => 'Mga naka-root na telepono';

  @override
  String get phoneDndAdbFor => 'Walang karagdagang app, gumagamit ng wireless debugging';

  @override
  String get phoneDndStateInUse => 'Ginagamit';

  @override
  String get phoneDndStateNotReady => 'Hindi pa handa';

  @override
  String get phoneDndStateUsable => 'Handa na';

  @override
  String get phoneDndStateNeedsGrant => 'Kailangan ng pahintulot';

  @override
  String get phoneDndStateNotRunning => 'Hindi tumatakbo';

  @override
  String get phoneDndStateNotInstalled => 'Hindi naka-install';

  @override
  String get phoneDndStateNotFound => 'Hindi nahanap';

  @override
  String get phoneDndStateViaSui => 'Sa pamamagitan ng Sui';

  @override
  String get phoneDndStateWaiting => 'Naghihintay';

  @override
  String get phoneDndStateDisconnected => 'Hindi nakakonekta';

  @override
  String get phoneDndStateNotPaired => 'Hindi naka-pair';

  @override
  String get phoneDndShizukuViaSui =>
      'Sa telepono na ito, galing sa Sui ang interface ng Shizuku. Gamitin na lang ang Sui.';

  @override
  String get phoneDndSuiMissing =>
      'Hindi nahanap ang Sui. I-install ang Sui module sa Magisk o KernelSU, i-restart ang telepono, saka bumalik.';

  @override
  String get phoneDndSuiRunning => 'Available ang interface ng Sui';

  @override
  String get phoneDndSuiStopped =>
      'Hindi available ang interface ng Sui. Tiyaking naka-enable ang Sui module, i-restart ang telepono at subukang muli.';

  @override
  String get phoneDndSuiAllSet => 'Handa na ang Sui.';

  @override
  String get phoneDndSuiPermissionFailed =>
      'Hindi makahingi ng pahintulot sa Sui. Tiyaking naka-enable ang Sui module at subukang muli.';

  @override
  String get phoneDndRootWaiting => 'Naghihintay sa root. Sagutin ang prompt ng iyong root manager.';

  @override
  String get phoneDndRootConnected =>
      'Nakakonekta ang root. Kung maputol ito, piliin itong muli rito; kusang humihingi ng root ang JDK-Go lang kapag naka-on ang “Panatilihin ang root channel” sa itaas.';

  @override
  String get phoneDndRootConnectedKept =>
      'Nakakonekta ang root. Kung maputol ito, kusang magtatanong muli ang JDK-Go sa iyong root manager.';

  @override
  String get phoneDndRootRetry => 'Humingi muli ng root';

  @override
  String get phoneDndInstallShizuku =>
      'I-install muna ang Shizuku (libre at open source). Kung gumagamit ka ng mga tool tulad ng Ice Box o Brevent, maaaring mayroon ka na nito.';

  @override
  String get phoneDndOpenShizukuSite => 'Buksan ang website ng Shizuku';

  @override
  String get phoneDndStartShizuku =>
      'Buksan ang Shizuku at sundin ang “Start via Wireless debugging” (nangangailangan ng Wi-Fi). Nagre-refresh ang pahinang ito pagbalik mo.';

  @override
  String get phoneDndGrantShizukuHint => 'Tumatakbo ang Shizuku. Susunod, payagan ang JDK-Go na gamitin ito.';

  @override
  String get phoneDndGrantShizuku => 'Payagan ang JDK-Go';

  @override
  String get phoneDndShizukuAllSet => 'Handa na ang Shizuku.';

  @override
  String get phoneDndShizukuInstalled => 'Naka-install ang Shizuku';

  @override
  String get phoneDndShizukuRunning => 'Tumatakbo ang Shizuku';

  @override
  String get phoneDndShizukuGranted => 'Pinayagan ang JDK-Go';

  @override
  String get phoneDndShizukuCompatibility =>
      'May mga isyu sa compatibility ang bersyong ito ng Android sa opisyal na release ng Shizuku.';

  @override
  String get phoneDndWirelessDebuggingOn => 'Naka-on ang wireless debugging';

  @override
  String get phoneDndPaired => 'Naka-pair';

  @override
  String get phoneDndConnected => 'Nakakonekta';

  @override
  String get phoneDndDeveloperOptionsStep =>
      'I-on ang Developer options: i-tap nang 7 beses ang “Build number” sa “About phone”. Sa Xiaomi, i-tap ang “OS version” sa “My device → Detailed info and specs”; sa vivo, i-tap ang “Software version”.';

  @override
  String get phoneDndWirelessDebuggingStep =>
      'I-on ang “Wireless debugging” sa Developer options habang nakakonekta sa Wi-Fi. Karaniwang nasa “System” o “Additional settings” ang Developer options.';

  @override
  String get phoneDndStartPairingStep =>
      'Bumalik dito at i-tap ang “Start pairing”. Magpapadala ang JDK ng notification.';

  @override
  String get phoneDndGetPairingCodeStep =>
      'Sa “Wireless debugging”, i-tap ang “Pair device with pairing code” para makita ang 6-digit na code.';

  @override
  String get phoneDndEnterPairingCodeStep =>
      'I-pull down ang mga notification at ilagay ang code sa notification ng JDK. Kapag naka-pair na, i-tap ang “Connect”.';

  @override
  String get phoneDndStartPairing => 'Simulan ang pairing';

  @override
  String get phoneDndPairingNotificationSent => 'Naipadala ang notification. Kunin ang code sa “Wireless debugging”.';

  @override
  String get phoneDndManualEntry => 'Ilagay nang manu-mano';

  @override
  String get phoneDndConnect => 'Kumonekta';

  @override
  String get phoneDndManualEntryHint => 'Walang input field sa notification? Gamitin ang “Ilagay nang manu-mano”.';

  @override
  String get phoneDndXiaomiUsbHint =>
      'Ang pag-on ng “USB debugging (Security settings)” ay nangangailangan ng SIM card at Xiaomi account.';

  @override
  String get phoneDndEnterCodeTitle => 'Ilagay ang pairing code';

  @override
  String get phoneDndCodeLabel => '6-digit na pairing code';

  @override
  String get phoneDndPortLabel => 'Port (opsyonal)';

  @override
  String get phoneDndPortHint => 'Ang numero pagkatapos ng colon sa “IP address & port” sa ibaba ng pairing code';

  @override
  String get phoneDndPair => 'I-pair';

  @override
  String get phoneConfirmAsk => 'Laging magtanong';

  @override
  String get phoneConfirmTask => 'Gawaing ito';

  @override
  String get phoneConfirmAlways => 'Laging laktawan';

  @override
  String get phoneConfirmAskHint => 'Nagtatanong bago pumasok sa bagong app, magpadala, magbura o magbayad';

  @override
  String get phoneConfirmTaskHint => 'Nagtatanong nang isang beses bawat gawain';

  @override
  String get phoneConfirmAlwaysHint => 'Kumikilos nang hindi nagtatanong';

  @override
  String get phoneConfirmTitle => 'Kumpirmasyon';

  @override
  String get phoneConfirmAlwaysTitle => 'Laging laktawan ang kumpirmasyon?';

  @override
  String get phoneConfirmAlwaysBody =>
      'Mangyayari nang hindi ka tinatanong ang pagbubukas ng mga app, pag-tap, pagpapadala at pagbura.';

  @override
  String get phoneConfirmSaveFailed => 'Hindi mabago. Subukang muli mamaya.';

  @override
  String get phoneEnableFailed => 'Hindi ma-on. Subukang muli mamaya.';

  @override
  String get phoneDisableFailed => 'Hindi ma-off. Subukang muli mamaya.';

  @override
  String get phoneEnabled => 'Naka-on';

  @override
  String get phoneDisabled => 'Naka-off';

  @override
  String get phoneOpenAccessibilityFailed =>
      'Hindi mabuksan ang settings. Hanapin ang JDK sa Settings → Accessibility.';

  @override
  String get phoneOpenAppInfoFailed => 'Hindi mabuksan ang app info. Hanapin ang JDK-Go sa Settings → Apps.';

  @override
  String get phoneStopFailed => 'Hindi mahinto. I-tap ang “Stop” sa floating bar o notification.';

  @override
  String get phoneControlTitle => 'Phone control';

  @override
  String get phoneControlSubtitle => 'Binabasa ang screen at nagta-tap para sa iyo. Ihinto anumang oras.';

  @override
  String get phoneControlWorking => 'Pinapatakbo ang iyong telepono';

  @override
  String get phoneControlTaskNoConfirmHint =>
      'Nilaktawan ang kumpirmasyon para sa gawaing ito · I-pause o ihinto mula sa floating bar';

  @override
  String get phoneControlFloatingBarHint => 'I-pause o ihinto mula sa floating bar';

  @override
  String get phoneControlAdvanced => 'Advanced';

  @override
  String get phoneControlKeepAliveHint => 'Pigilan ang Android na i-off ang accessibility';

  @override
  String get phoneControlReadingEllipsis => 'Binabasa…';

  @override
  String get phoneControlNotReady => 'Hindi pa handa';

  @override
  String get phoneControlNotEnabled => 'Naka-off';

  @override
  String get phoneControlSafeModeNotLoaded => 'Hindi na-load sa Safe mode';

  @override
  String get phoneControlLocalOnly => 'Available lang sa engine ng telepono na ito';

  @override
  String get phoneControlAfterEngineStarts => 'Magkakabisa kapag nagsimula ang engine';

  @override
  String get phoneControlNeedsAccessibility => 'Isang hakbang na lang: i-on ang accessibility';

  @override
  String get phoneControlReady => 'Handa nang kontrolin ang iyong telepono';

  @override
  String get phoneControlSetup => 'Setup';

  @override
  String get phoneControlAccessibilityService => 'Accessibility service';

  @override
  String get phoneControlAccessibilityReady => 'Handa nang magbasa ng screen at mag-tap';

  @override
  String get phoneControlAccessibilityReconnect => 'Na-disconnect ang serbisyo. I-off at i-on itong muli.';

  @override
  String get phoneControlAccessibilityHint => 'Kailangan para sa pagbasa ng screen at pag-tap';

  @override
  String get phoneControlGoSettings => 'Buksan ang settings';

  @override
  String get phoneControlGoEnable => 'I-on';

  @override
  String get phoneControlAccessibilityBlocked => 'Naka-disable ang accessibility switch?';

  @override
  String get phoneControlRestrictedAfterAttempt =>
      'Mukhang hindi ito na-on. Kailangan muna ng “Allow restricted settings” ang mga sideloaded na app.';

  @override
  String get phoneControlRestrictedHint => 'Kailangan muna ng “Allow restricted settings” ang mga sideloaded na app';

  @override
  String get phoneControlNotifications => 'Mga notification';

  @override
  String get phoneControlNotificationsPairingHint => 'Ginagamit para sa mga pag-apruba, pagtigil at pairing code';

  @override
  String get phoneControlNotificationsHint => 'Kailangan para sa mga pag-apruba at sa button na “Stop”';

  @override
  String get phoneControlAllowed => 'Pinapayagan';

  @override
  String get phoneControlTry => 'Subukan';

  @override
  String get phoneControlReadScreen => 'Basahin ang kasalukuyang screen';

  @override
  String get phoneControlReadScreenHint => 'Tingnan kung ano ang binabasa ng JDK, nang hindi ipinapadala sa model';

  @override
  String get phoneControlEnableAccessibilityFirst => 'I-on muna ang accessibility service';

  @override
  String get phoneControlLoading => 'Nilo-load';

  @override
  String get phoneControlRules => 'Mga patakaran';

  @override
  String get phoneControlRecentActions => 'Mga kamakailang aksyon';

  @override
  String get phoneControlRecentActionsHint => 'Naka-log ang bawat hakbang, nang walang nilalaman ng screen';

  @override
  String get phoneControlAllActions => 'Lahat ng aksyon';

  @override
  String get phoneControlModuleNotReady => 'Hindi pa handa ang phone control sa bersyong ito';

  @override
  String get phoneControlSafeModeUnavailable => 'Hindi available sa Safe mode';

  @override
  String get phoneControlSafeModeHint =>
      'Nilalaktawan ng Safe mode ang mga plugin. Lumipat sa normal na mode para magamit ito.';

  @override
  String get phoneControlRemoteHost => 'Nakakonekta sa remote host';

  @override
  String get phoneControlCapabilities => 'Ang magagawa mo';

  @override
  String get phoneControlIntents => 'Mga alarm, event, mapa, pagbabahagi';

  @override
  String get phoneControlNoExtraPermissions => 'Walang kailangang karagdagang pahintulot';

  @override
  String get phoneControlReadToTable => 'Basahin ang screen sa mga talahanayan o gawain';

  @override
  String get phoneControlNeedsAccessibilityHint => 'Nangangailangan ng accessibility';

  @override
  String get phoneControlTapType => 'Mag-tap at mag-type para sa iyo';

  @override
  String get phoneControlSensitiveHint => 'Nagtatanong bago magpadala o bumili. Hindi kailanman nagbabayad.';

  @override
  String get phoneDisclosureWhatTitle => 'Ang binabasa nito';

  @override
  String get phoneDisclosureWhatBody =>
      'Teksto sa kasalukuyang screen. Sa vision model, maaaring isama ang screenshot.';

  @override
  String get phoneDisclosureWhenTitle => 'Kailan ito bumabasa';

  @override
  String get phoneDisclosureWhenBody =>
      'Kapag nagsimula ka lang ng gawain o nag-tap ng “Basahin ang kasalukuyang screen”. Hindi kailanman sa ibang pagkakataon.';

  @override
  String get phoneDisclosureWhoTitle => 'Sino ang tumatanggap';

  @override
  String get phoneDisclosureWhoBody =>
      'Ang napili mong DeepSeek model sa cloud. Minamaskara muna ang mga numero ng bank card at ID.';

  @override
  String get phoneDisclosureNeverTitle => 'Ang hindi nito gagawin bilang default';

  @override
  String get phoneDisclosureNeverBody =>
      'Hindi naglalagay ng mga password o verification code, o nagbabago ng system settings. Ibinabalik ito sa iyo, at lumalayo sa mga app ng bangko at pagbabayad.';

  @override
  String get phoneDisclosureStopTitle => 'Ihinto anumang oras';

  @override
  String get phoneDisclosureStopBody =>
      'Hinahayaan ka ng floating bar na mag-pause, huminto o gumabay. Panatilihing bukas at naka-unlock ang screen.';

  @override
  String get phoneDisclosureTitle => 'Bago i-on ang Phone control';

  @override
  String get phoneDisclosureIntro =>
      'Binabasa ng JDK ang screen at nagta-tap tulad mo para matapos ang mga bagay-bagay. Bago ito i-on, narito ang dapat mong malaman:';

  @override
  String get phoneDisclosureRestartNote => 'Mare-restart ang engine, na puputol sa anumang sagot na isinasagawa';

  @override
  String get phoneDisclosureNotNow => 'Hindi ngayon';

  @override
  String get phoneDisclosureAgreeEnable => 'Sumang-ayon';

  @override
  String get phoneCheckUnknown => 'Hindi sigurado';

  @override
  String get phoneCheckYes => 'Oo';

  @override
  String get phoneCheckNotYet => 'Hindi pa';

  @override
  String get phoneRomStock => 'Stock / Iba pa';

  @override
  String get phoneRestrictedAccessibility => 'Accessibility';

  @override
  String get phoneRestrictedOpenAccessibility => 'I-on ang accessibility';

  @override
  String get phoneRestrictedOverlay => 'Floating window';

  @override
  String get phoneRestrictedOpenOverlay => 'I-on ang floating window';

  @override
  String get phoneRestrictedTryAccessibility =>
      'Subukan munang i-on ang JDK sa “Accessibility”. Kapag lumabas ang “Restricted setting”, i-tap ang “OK”. Lalabas lang ang opsyon sa ibaba pagkatapos ng hakbang na ito.';

  @override
  String get phoneRestrictedOpenInfoStep => 'Bumalik dito at i-tap ang “Buksan ang app info”.';

  @override
  String get phoneRestrictedBackAccessibility => 'Bumalik sa “Accessibility” at i-on ang JDK.';

  @override
  String get phoneRestrictedMenuStep =>
      'I-tap ang tatlong tuldok sa kanang itaas, piliin ang “Allow restricted settings”, saka i-verify ang password ng iyong lock screen.';

  @override
  String get phoneRestrictedTryOverlay =>
      'Subukan munang i-on ang JDK-Go sa mga setting ng floating window. Kapag lumabas ang “Restricted setting”, i-tap ang “OK”. Lalabas lang ang opsyon sa ibaba pagkatapos ng hakbang na ito.';

  @override
  String get phoneRestrictedBackOverlay => 'Bumalik sa mga setting ng floating window at i-on ang JDK-Go.';

  @override
  String get phoneRestrictedHuaweiOverlay =>
      'Karaniwang nilalaktawan ng HarmonyOS 4 at mas luma ang hakbang na ito. I-on nang direkta ang JDK-Go sa mga setting ng floating window.';

  @override
  String get phoneRestrictedHuaweiAccessibility =>
      'Karaniwang nilalaktawan ng HarmonyOS 4 at mas luma ang hakbang na ito. I-on nang direkta ang JDK sa “Accessibility”.';

  @override
  String get phoneRestrictedVivoNote =>
      'Nag-iiba ang lokasyon ayon sa bersyon ng OriginOS. Kung walang tatlong tuldok, mag-scroll sa ibaba ng App info.';

  @override
  String get phoneRestrictedAdvancedStep =>
      'Sa “Advanced settings”, hanapin ang “Allow restricted settings” at i-on ito.';

  @override
  String get phoneRestrictedOppoNote =>
      'Maaaring itago ng ColorOS ang opsyong ito. Gamitin ang built-in na Files app para hanapin ang installer ng JDK at mag-install sa ibabaw ng umiiral na app (hindi kailangang mag-uninstall; mananatili ang mga chat at setting). Saka i-on ang accessibility.';

  @override
  String get phoneRestrictedHuaweiNote =>
      'Kung lumabas ang “Restricted setting” sa Accessibility, sundin ang mga hakbang ng “Stock / Iba pa”.';

  @override
  String get phoneRestrictedTitle => 'Payagan ang restricted settings';

  @override
  String get phoneRestrictedSteps => 'Mga hakbang';

  @override
  String get phoneRestrictedDiagram => 'Paglalarawan';

  @override
  String get phoneRestrictedOpenInfo => 'Buksan ang app info';

  @override
  String get phoneRestrictedOpenOverlayFailed =>
      'Hindi mabuksan ang mga setting ng floating window. Maghanap ng “Floating window” sa Settings.';

  @override
  String get phoneRestrictedOpenAccessibilityFailed =>
      'Hindi mabuksan ang mga setting ng accessibility. Maghanap ng “Accessibility” sa Settings.';

  @override
  String get phoneRestrictedFootnote =>
      'Nag-iiba ang mga pangalan ayon sa system. Maghanap ng “Restricted” sa Settings kung kinakailangan. Kung hindi pa rin ito mabuksan, i-restart ang telepono at subukang muli.';

  @override
  String get phoneRestrictedAppInfo => 'App info';

  @override
  String get phoneRestrictedPermissionsManager => 'Permission manager';

  @override
  String get phoneRestrictedBatterySaver => 'Battery saver';

  @override
  String get phoneRestrictedAdvanced => 'Advanced settings';

  @override
  String get phoneRestrictedPermissions => 'Mga pahintulot';

  @override
  String get phoneRestrictedBattery => 'Baterya';

  @override
  String get phoneRestrictedDiagramAdvanced =>
      'Paglalarawan: Sa App info, i-tap ang “Advanced settings”, saka i-on ang “Allow restricted settings”.';

  @override
  String get phoneRestrictedDiagramMenu =>
      'Paglalarawan: Sa App info, i-tap ang tatlong tuldok sa kanang itaas, saka piliin ang “Allow restricted settings”.';

  @override
  String get phoneRestrictedCaptionAdvanced => '① I-tap ang “Advanced settings”';

  @override
  String get phoneRestrictedCaptionMenu => '① I-tap ang tatlong tuldok';

  @override
  String get phoneRestrictedCaptionToggle => '② I-on ang switch na ito';

  @override
  String get phoneRestrictedCaptionOption => '② Piliin ang opsyong ito';

  @override
  String get phoneScreenReadFailed => 'Hindi mabasa ang screen';

  @override
  String get phoneScreenUnknownReason => 'Hindi kilalang dahilan';

  @override
  String get phoneScreenReadFailedHint =>
      'Tiyaking naka-on ang accessibility. Hinaharang ng Android ang pagbasa ng mga screen ng password at pagbabayad.';

  @override
  String get phoneScreenCurrent => 'Kasalukuyang screen';

  @override
  String get phoneScreenEmpty => '(Walang nababasang teksto sa screen)';

  @override
  String get phoneScreenReadNote => 'Ito ang makikita ng model. Hindi ipinadala sa model ang pagbasang ito.';

  @override
  String get phoneFailureSafeStartup => 'Hindi masimulan kahit sa Safe mode';

  @override
  String get phoneFailureSafeStartupHint => 'Malamang na isyu sa global configuration o runtime';

  @override
  String get phoneFailureKilled => 'Itinigil ng Android ang engine';

  @override
  String get phoneFailureKilledHint => 'Malamang na mababang memorya o mga paghihigpit sa baterya';

  @override
  String get phoneFailureLaunch => 'Hindi masimulan ang lokal na runtime';

  @override
  String get phoneFailureLaunchHint => 'Suriin ang mga log, o kumonekta sa remote host para magpatuloy';

  @override
  String get phoneFailureNoSpaceHint => 'Magbakante ng kaunting espasyo at subukang muli';

  @override
  String get phoneFailureStartup => 'Hindi masimulan ang JDK';

  @override
  String get phoneFailureCrashedEarly => 'Nag-crash ang JDK ilang sandali matapos magsimula';

  @override
  String get phoneFailureCrashedLate => 'Nag-crash ang JDK habang tumatakbo';

  @override
  String get phoneFailureFatal => 'Nag-ulat ang engine ng fatal na error';

  @override
  String get phoneFailureRestore => 'Ibalik ang configuration';

  @override
  String get phoneFailureEnterSafe => 'Pumasok sa Safe mode';

  @override
  String get phoneFailureStartNormal => 'Simulan nang normal';

  @override
  String get phoneFailureGlobalPatch => 'Global patch';

  @override
  String get phoneFailureEnvironment => 'Mga environment variable';

  @override
  String get phoneSafeMoveAsideTitle => 'Ilipat muna sa tabi ang mga file na ito?';

  @override
  String get phoneSafeMoveAsideIntro => 'Naaapektuhan nila ang lahat ng configuration, kasama ang Safe mode:';

  @override
  String get phoneSafeMoveAsideNote =>
      'Pinapalitan ang pangalan ng mga file (gamit ang .off-timestamp), hindi kailanman binubura. Maaari mong ibalik ang pangalan nila pagkatapos ayusin ang isyu.';

  @override
  String get phoneSafeStartDirectly => 'Simulan nang direkta';

  @override
  String get phoneSafeMoveAsideStart => 'Ilipat at simulan';

  @override
  String get phoneSafeNoRestoreNeeded =>
      'Tugma ang configuration sa huling gumaganang bersyon. Hindi kailangan ang pagbabalik.';

  @override
  String get phoneSafeNoRestoreRecord => 'Walang naitalang nakaraang gumaganang configuration';

  @override
  String get phoneSafeRestoreTitle => 'Ibalik ang huling gumaganang configuration?';

  @override
  String get phoneSafeRestoreStart => 'Ibalik at simulan';

  @override
  String get phoneSafeRestoredStarting => 'Naibalik ang huling gumaganang configuration. Nagsisimula…';

  @override
  String get phoneSafeRestoreFailed => 'Hindi maibalik';

  @override
  String get phoneSafeStopIncomplete =>
      'Hindi makumpirmang huminto ang engine. Hindi binago ang configuration. Suriin ang mga log ng engine bago subukang muli.';

  @override
  String get phoneSafeRestartIncomplete =>
      'Natapos ang operasyon sa configuration, ngunit hindi pa huminto o nag-restart ang engine. Hintayin itong huminto bago ito simulan muli.';

  @override
  String get phoneSafeRestoreIntro => 'Ibabalik ng JDK ang huling gumaganang configuration:';

  @override
  String get phoneSafeRestoreSettings =>
      '• Ibalik ang mga setting sa bersyong iyon (i-save ang kasalukuyang mga setting bilang backup)';

  @override
  String get phoneSafeRestoreNote =>
      'Walang plugin na ia-uninstall. Hindi kailangan ng internet. Maaari mong i-enable muli ang mga na-disable na plugin mamaya.';

  @override
  String get phoneSafeLeaveTitle => 'Bumalik sa normal na mode?';

  @override
  String get phoneSafeLeaveBody =>
      'Magsimula sa iyong orihinal na configuration at mga plugin. Hindi pananatilihin ang mga web setting na binago sa Safe mode.';

  @override
  String get phoneSafeLeave => 'Bumalik sa normal na mode';

  @override
  String get phoneSafeMovePatch => 'Ilipat sa tabi ang patch';

  @override
  String get phoneSafeMoveFiles => 'Ilipat sa tabi ang mga file';

  @override
  String get phoneSafeFailureLog => 'Mga log sa paligid ng pagkabigo';

  @override
  String get phoneSafeFailureLogEmpty => 'Walang output na naitala noong nabigo';

  @override
  String get phoneSafeBannerTitle => 'Safe mode · Hindi na-load ang mga plugin';

  @override
  String get phoneSafeBannerProbation => 'Sinusubukan ang normal na mode';

  @override
  String get phoneSafeBannerProbationHint =>
      'Kung walang error sa loob ng 2 minuto, kumpleto na ang pagbawi. Kung hindi, awtomatikong babalik ang Safe mode.';

  @override
  String get phoneSafeBannerRunningHint =>
      'Ligtas ang iyong mga chat. Ayusin ang configuration, saka bumalik sa normal na mode.';

  @override
  String get phoneSafeBannerFailedHint => 'Hindi masimulan kahit sa Safe mode. Tingnan ang pahina ng engine.';

  @override
  String get phoneSafeBannerStoppedHint => 'Huminto ang engine. Safe mode pa rin ang gagamitin sa susunod na simula.';

  @override
  String get phoneSafeRepair => 'Tulungan akong ayusin ito';

  @override
  String get phoneSafeReasonStartup => 'Nabigong magsimula nang dalawang magkasunod na beses';

  @override
  String get phoneSafeReasonProbation => 'Nag-crash muli pagkatapos ng pagbawi';

  @override
  String get phoneSafeReasonManual => 'Manu-manong in-on';

  @override
  String get phoneSafeNormalSettingsHint => 'I-restart gamit ang orihinal na configuration at mga plugin';

  @override
  String get phoneSafeStartSettings => 'Simulan sa Safe mode';

  @override
  String get phoneSafeStartSettingsHint => 'Laktawan ang mga plugin para ma-troubleshoot ang pagsisimula';

  @override
  String get phoneSafeAutoSettings => 'Awtomatikong Safe mode';

  @override
  String get phoneSafeAutoSettingsHint => 'I-on pagkatapos ng paulit-ulit na pagkabigo sa pagsisimula';

  @override
  String get phoneAccentMist => 'Mist';

  @override
  String get phoneAccentDaiqing => 'Teal';

  @override
  String get phoneAccentDusk => 'Dusk';

  @override
  String get phoneAccentTurquoise => 'Aqua';

  @override
  String get phoneAccentAmber => 'Amber';

  @override
  String get phoneAccentGraphite => 'Slate';

  @override
  String get phoneAccentCustom => 'Custom';

  @override
  String phoneEngineInstallPercent(int percent) {
    return 'Ini-install · $percent%';
  }

  @override
  String phoneEngineStatusSemantics(String prefix, String status) {
    return '$prefix engine: $status';
  }

  @override
  String phoneLogLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linya', one: '1 linya');
    return '$_temp0';
  }

  @override
  String phoneLogCopiedLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nakopya ang $count linya',
      one: 'Nakopya ang 1 linya',
    );
    return '$_temp0';
  }

  @override
  String phoneAppRuleDefault(String rule) {
    return 'Default: $rule';
  }

  @override
  String phoneAppRulesLoosenTitle(String app) {
    return 'Payagan ang JDK na patakbuhin ang “$app”?';
  }

  @override
  String phoneAppRulesSkipStepsTitle(String app) {
    return 'Itigil ang pagkumpirma sa bawat hakbang sa “$app”?';
  }

  @override
  String phoneDndBrowserFailed(String url) {
    return 'Hindi mabuksan ang browser. URL: $url';
  }

  @override
  String phoneDndChannelReady(String channel) {
    return '$channel · Handa na';
  }

  @override
  String phoneDndChannelStatus(String channel, String reason) {
    return '$channel · $reason';
  }

  @override
  String phoneDndUsing(String channel) {
    return 'Gumagamit ng $channel';
  }

  @override
  String phoneDndEnableWith(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'I-on gamit ang Shizuku',
      'sui': 'I-on gamit ang Sui',
      'root': 'I-on gamit ang Root',
      'adb': 'I-on gamit ang Direct ADB',
      'other': 'I-on',
    });
    return '$_temp0';
  }

  @override
  String phoneDndSwitchTo(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'Lumipat sa Shizuku',
      'sui': 'Lumipat sa Sui',
      'root': 'Lumipat sa Root',
      'adb': 'Lumipat sa Direct ADB',
      'other': 'Lumipat sa channel na ito',
    });
    return '$_temp0';
  }

  @override
  String phoneControlWorkingApp(String app) {
    return 'Pinapatakbo ang “$app”';
  }

  @override
  String phoneControlPolicySummary(int denied, int confirmed) {
    String _temp0 = intl.Intl.pluralLogic(
      denied,
      locale: localeName,
      other: '$denied app ang bawal',
      one: '1 app ang bawal',
    );
    String _temp1 = intl.Intl.pluralLogic(
      confirmed,
      locale: localeName,
      other: '$confirmed app ang nagkukumpirma sa bawat hakbang',
      one: '1 app ang nagkukumpirma sa bawat hakbang',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String phoneControlRemoteHint(String host) {
    return 'Hindi makokontrol ng JDK sa “$host” ang telepono na ito. Lumipat sa “Telepono na ito” para magamit ito.';
  }

  @override
  String phoneRestrictedSubtitle(String place) {
    return 'Payagan ito para sa mga sideloaded na app para ma-enable ang switch ng $place';
  }

  @override
  String phoneRestrictedDone(String place) {
    return 'Naka-on ang $place. Maaari ka nang bumalik.';
  }

  @override
  String phoneFailurePlugins(String plugins) {
    return 'Maaaring may kaugnayan sa mga plugin na “$plugins”';
  }

  @override
  String phoneFailureRequired(String components) {
    return 'Nabigo sa mga startup check ang mga kinakailangang component na $components';
  }

  @override
  String phoneSafeRestoreAt(String when) {
    return 'Ibabalik ng JDK ang gumaganang configuration mula $when:';
  }

  @override
  String phoneSafeRestoreDisable(String plugins) {
    return '• I-disable: $plugins';
  }

  @override
  String phoneSafeRestoreChanged(String plugins) {
    return '  (na-update ang $plugins mula noon; maaari lang i-disable sa ngayon)';
  }

  @override
  String phoneSafeRestoreEnable(String plugins) {
    return '• I-enable muli: $plugins';
  }

  @override
  String phoneSafeTodayTime(String time) {
    return 'Ngayon $time';
  }

  @override
  String phoneSafeReasonPlugins(String plugins) {
    return 'Nabigong magsimula nang dalawang magkasunod na beses. Mga pinaghihinalaang plugin: $plugins';
  }

  @override
  String get phoneListSeparator => ',';

  @override
  String get phonePluginQuoteSeparator => '”, “';

  @override
  String phoneEngineRunningAt(String address) {
    return 'Tumatakbo · $address';
  }

  @override
  String phoneEngineSafeAt(String address) {
    return 'Safe mode · $address';
  }

  @override
  String get phoneAppRulesLoosenBody =>
      'Natutukoy ng mga app ng bangko at pagbabayad ang automation at maaaring higpitan ang pag-sign in o i-freeze ang iyong account. Bilang default, hindi maglalagay ng mga password o magbabayad ang JDK.';

  @override
  String get phoneAppRulesSkipStepsBody =>
      'Binabantayan ng mga app tulad ng WeChat ang automation, at may mga phone assistant na na-sign out ang mga account. Sa “Gaya ng dati”, ang mga aksyon lang tulad ng pagpapadala ng mensahe ang nagtatanong pa rin muna.';

  @override
  String get phoneResetDeletesChatsWorkspaces => 'mga chat at workspace';

  @override
  String get phoneResetBodyChatsWorkspaces =>
      'Buburahin nito ang mga chat at workspace, saka i-install muli ang runtime.';

  @override
  String get phoneResetDeletesWithPlugins => 'mga chat, workspace, plugin at setting';

  @override
  String get phoneResetBodyWithPlugins =>
      'Buburahin nito ang mga chat, workspace, plugin at setting, saka i-install muli ang runtime.';

  @override
  String get phoneResetDeletesWithUi => 'mga chat, workspace, setting ng interface at skill';

  @override
  String get phoneResetBodyWithUi =>
      'Buburahin nito ang mga chat, workspace, setting ng interface at skill, saka i-install muli ang runtime.';

  @override
  String get phoneResetDeletesEverything => 'mga chat, workspace, plugin, setting, setting ng interface at skill';

  @override
  String get phoneResetBodyEverything =>
      'Buburahin nito ang mga chat, workspace, plugin, setting, setting ng interface at skill, saka i-install muli ang runtime.';

  @override
  String phoneEngineStorageDetails(String needed, String free) {
    return 'Kulang ang storage: humigit-kumulang $needed MB ang kailangan, $free MB ang available';
  }

  @override
  String get phoneControlEnabledRestarting => 'Naka-on · Nire-restart ang engine';

  @override
  String get phoneControlDisabledRestarting => 'Naka-off · Nire-restart ang engine';

  @override
  String get phoneControlEnabledPending => 'Naka-on · Magkakabisa kapag nagsimula ang engine';

  @override
  String get phoneReturnAfterDone => 'Bumalik sa JDK-Go kapag tapos na';

  @override
  String get phoneReturnAfterDoneHint => 'Isinasara ang bar, binubuksan ang chat';

  @override
  String get phoneFloatingBar => 'Floating bar';

  @override
  String get phoneIdleOpacity => 'Opacity kapag idle';

  @override
  String get phoneAutoCollapse => 'I-collapse kapag idle';

  @override
  String get phoneAutoCollapseHint => 'Nagiging bola; i-tap para buksan';

  @override
  String get phoneDeveloperOptions => 'Developer options';

  @override
  String get phoneDirectEngine => 'Direktang paglunsad ng lokal na engine';

  @override
  String get phoneDirectHint =>
      'Eksperimental at naka-off bilang default; nalalapat sa susunod na simula. Hinaharang ng ilang telepono (Android 16, halimbawa) ang direktang pagsisimula, at kusang babalik ang app sa compatible launch. Hindi apektado ang iyong data.';

  @override
  String get phoneDirectFailedHint =>
      'Hindi gumana ang direktang paglunsad sa telepono na ito, kaya compatible launch ang gagamitin. Ihinto ang engine at i-on ito para subukang muli.';

  @override
  String get phoneDirectCompatibleHint =>
      'Compatible launch ang ginamit sa pagsisimulang ito; nasa itaas ang dahilan. Pinananatili ang pinili mo, at susubukan muli sa susunod na simula.';

  @override
  String get phoneDirectStopFirst => 'Ihinto ang lokal na engine bago baguhin ang paraan ng paglunsad nito.';

  @override
  String get phoneDirectSafeHint =>
      'Compatible launch ang gamit ng Safe mode. Nalalapat ang pagpiling ito kapag bumalik ka sa normal na mode.';

  @override
  String get phoneDirectNeedsRuntime =>
      'Nangangailangan ng runtime na may suporta sa direktang paglunsad ang opsyong ito.';

  @override
  String get phoneDirectChangeFailed =>
      'Hindi mabago ang paraan ng paglunsad. Ihinto ang lokal na engine at subukang muli.';

  @override
  String get phoneActualLaunchMode => 'Kasalukuyang paglunsad';

  @override
  String get phoneLaunchNotObserved => 'Hindi tumatakbo';

  @override
  String get phoneLastLaunchSelection => 'Huling paglunsad';

  @override
  String get phoneDirectRejectedReason => 'Dahilan ng fallback';

  @override
  String get phoneLaunchFailureReason => 'Huling pagkabigo';

  @override
  String get phoneReturnCompatible => 'Gamitin ang compatible launch';

  @override
  String get phoneLaunchDirect => 'Direktang paglunsad';

  @override
  String get phoneLaunchCompatible => 'Compatible launch';

  @override
  String get phoneDirectIncompatibleFiles =>
      'Hindi pa naaayos ang mga file ng plugin, compatible launch muna sa ngayon';

  @override
  String get phoneDirectNotEnoughSpace => 'Kulang ang storage, compatible launch muna sa ngayon';

  @override
  String get phoneDirectMigrationFailed => 'Hindi tapos ang pag-aayos ng file, compatible launch muna sa ngayon';

  @override
  String get phoneDirectLaunchFailed => 'Nabigo ang direktang paglunsad';

  @override
  String get phoneLaunchStartFailed => 'Hindi natapos ang pagsisimula';

  @override
  String phoneLaunchExited(String code) {
    return 'Exit code $code';
  }

  @override
  String get phoneDndManualConnect => 'Kumonekta gamit ang port';

  @override
  String get phoneDndConnectPortLabel => 'Connection port';

  @override
  String get phoneDndConnectPortHint =>
      'Sa pangunahing pahina ng mga setting ng Wireless debugging, hanapin ang “IP address & port” at ilagay ang port pagkatapos ng colon. Huwag gamitin ang port ng pairing-code dialog.';

  @override
  String get phonePreviewTitle => 'Live na preview ng background';

  @override
  String get phonePreviewDescription =>
      'Binabasa lang ang mga frame habang nakikita ang preview at nananatili sa device na ito. View-only ang preview.';

  @override
  String get phonePreviewOpen => 'Tingnan ang background screen';

  @override
  String phonePreviewTask(String taskId) {
    return 'I-preview ang gawain $taskId';
  }

  @override
  String get phonePreviewInUse => 'May ibang gawaing pini-preview';

  @override
  String get phonePreviewOff => 'Natapos ang gawain o naka-off ang preview';

  @override
  String get phonePreviewUnavailable => 'Hindi available ang preview o protektado ang screen';

  @override
  String get phonePreviewWaiting => 'Naghihintay ng bagong background frame';

  @override
  String get phoneViewportTitle => 'Background viewport';

  @override
  String get phoneViewportDescription =>
      'Nalalapat kapag nalikha ang susunod na background screen. Hindi nagbabago ang kasalukuyang screen; ang muling paglikha nito pagkatapos ng handoff ay gagamit ng bagong setting. Hindi nito pinipilit paikutin ang mga app.';

  @override
  String get phoneViewportPortrait => 'Portrait';

  @override
  String get phoneViewportLandscape => 'Landscape';

  @override
  String get phoneResumeTask => 'Payagan muli ang phone control';

  @override
  String get phoneResumeTaskHint =>
      'Payagan ang mga susunod na aksyon ng telepono sa usapang ito. Hindi uulitin ang mga natapos na aksyon.';

  @override
  String get phoneResumeTaskFailed => 'Hindi maituloy. Maaaring tinatapos pa ang nakaraang aksyon.';

  @override
  String phoneStoppedTask(int task) {
    return 'Huminto ang gawain sa telepono na $task';
  }

  @override
  String get phoneTaskDrainingHint => 'Naghihintay na matapos ang nakaraang aksyon at paglilinis ng background screen.';

  @override
  String get phoneTaskCleanupFailedHint =>
      'Hindi makumpirma ang paglilinis ng background screen. Nananatiling naka-block ang phone control.';

  @override
  String phoneFinishingTask(int task) {
    return 'Tinatapos ang gawain sa telepono na $task';
  }

  @override
  String get phoneCleanupRetry => 'Subukang muli ang paglilinis';

  @override
  String get phoneCleanupRetryFailed =>
      'Hindi pa nakukumpirma ang nakaraang background screen. Nananatiling nakareserba ang screen access nito.';

  @override
  String get phoneSelfCheckTitle => 'Lokal na self-check ng telepono';

  @override
  String get phoneSelfCheckPartial => 'Bahagyang pagsusuri — mga naobserbahang item lang ang may resulta';

  @override
  String get phoneSelfCheckScope =>
      'Gumagamit ng napiling nakakonektang channel at pansamantalang presentation display. Hindi sinusubok ang paglunsad ng app, text input, screenshot, OCR at pang-aabala sa MAIN. Hindi nagpapatunay na nalikha ang display ang paglilinis lamang.';

  @override
  String get phoneSelfCheckStart => 'Simulan ang bahagyang pagsusuri';

  @override
  String get phoneSelfCheckCancel => 'Humiling ng pagkansela';

  @override
  String get phoneSelfCheckRetry => 'Subukang muli ang paglilinis lang';

  @override
  String get phoneSelfCheckRefresh => 'I-refresh ang katayuan';

  @override
  String get phoneSelfCheckSave => 'I-save ang sanitized na ulat';

  @override
  String get phoneSelfCheckSaving => 'Sine-save…';

  @override
  String get phoneSelfCheckSaved => 'Na-save ang ulat sa Downloads/DSH-Go.';

  @override
  String get phoneSelfCheckSaveFailed => 'Hindi ma-save ang ulat.';

  @override
  String get phoneSelfCheckReportHint =>
      'I-save lang kapag pinili mo. Naglalaman ang lokal na ulat ng mga nakapirming resulta, nang walang screenshot, nakilalang teksto, log, data ng account o run identifier.';

  @override
  String phoneSelfCheckRunState(String state) {
    String _temp0 = intl.Intl.selectLogic(state, {
      'idle': 'Hindi pa nasimulan',
      'running': 'Tumatakbo ang bahagyang pagsusuri',
      'cleaning': 'Naglilinis; hindi binabawi ng pagkansela ang naipadalang input',
      'done': 'Natapos ang pagpapatupad at paglilinis; suriin ang bawat resulta sa ibaba',
      'cancelled': 'Kinansela; nananatiling naitala ang mga naobserbahang aksyon',
      'cleanup_pending': 'Hindi nakumpirma ang paglilinis — nananatiling nakareserba ang mga resource',
      'other': 'Hindi available ang katayuan',
    });
    return '$_temp0';
  }

  @override
  String phoneSelfCheckStepState(String state) {
    String _temp0 = intl.Intl.selectLogic(state, {
      'not_run': 'Hindi pinatakbo / walang obserbasyon',
      'running': 'Tumatakbo',
      'pass': 'Naobserbahang pumasa',
      'fail': 'Nabigo',
      'skipped': 'Nilaktawan',
      'unknown': 'Hindi nakumpirma',
      'cancelled': 'Kinansela',
      'other': 'Hindi nakumpirma',
    });
    return '$_temp0';
  }

  @override
  String phoneSelfCheckStage(String stage) {
    String _temp0 = intl.Intl.selectLogic(stage, {
      'device': 'Mga paunang kondisyon ng device',
      'channel': 'Napiling channel',
      'display': 'Pansamantalang background display',
      'input_probe': 'Touch receiver',
      'launch': 'Paglunsad ng app',
      'tree': 'Accessibility tree',
      'tap': 'Pag-tap ng button ng app',
      'scroll': 'Pag-scroll ng app',
      'back': 'Back action ng app',
      'text_ascii': 'Nakapirming ASCII input',
      'text_zh': 'Nakapirming Chinese input',
      'capture': 'Lokal na pattern capture',
      'continuity': 'Limitadong kontroladong refresh',
      'main': 'Limitadong obserbasyon sa MAIN',
      'ocr': 'Lokal na OCR',
      'cleanup': 'Mahigpit na paglilinis',
      'other': 'Hindi kilalang item',
    });
    return '$_temp0';
  }

  @override
  String phoneSelfCheckReason(String reason) {
    String _temp0 = intl.Intl.selectLogic(reason, {
      'busy': 'Abala ang telepono o channel.',
      'unsupported': 'Hindi sinusuportahan ng device o peer na ito ang pagsusuring ito.',
      'cancelled': 'Kinansela o inalis ang kahilingang ito.',
      'disabled': 'Naka-off ang phone control.',
      'locked': 'Naka-lock ang device.',
      'identity': 'Hindi na tugma ang orihinal na takbo o channel.',
      'invalid': 'Hindi ma-verify ang kahilingan o resulta.',
      'display': 'Hindi ma-verify ang pansamantalang display.',
      'input': 'Hindi nakumpirma ang pagtanggap o paghahatid ng input. Hindi inuulit ang naipadalang input.',
      'cleanup': 'Hindi nakumpirma ang paglilinis ng resource. Subukang muli ang paglilinis lang.',
      'denied': 'Tinanggihan ng system ang operasyon.',
      'timeout': 'Nag-time out ang operasyon; maaaring matapos pa rin ang naipadalang gawain.',
      'unavailable': 'Hindi available ang lokal na katayuan o napiling channel.',
      'target_unavailable': 'Hindi ma-verify ang nakapirming target. Tapusin ang paglilinis bago magsimulang muli.',
      'target_changed': 'Nagbago ang orihinal na target. Magpatuloy lang sa paglilinis.',
      'target_cleanup': 'Hindi nakumpirma ang paglilinis ng target. Subukang muli ang paglilinis lang.',
      'target_main': 'Naobserbahan ang target sa MAIN. Huminto ang mga susunod na hakbang; tapusin ang paglilinis.',
      'target_readback':
          'Hindi tumugma ang nakapirming bilang o teksto ng target. Huwag ulitin ang aksyon; tapusin ang paglilinis.',
      'tree_cleanup': 'Hindi nakumpirma ang paglilinis ng koneksyon ng tree. Subukang muli ang paglilinis lang.',
      'target_launch':
          'Tinanggihan o hindi nakumpirma ang paglunsad ng target. Suriin ang device at tapusin ang paglilinis.',
      'frame_unavailable':
          'Walang nakitang magagamit na lokal na pattern frame. Tapusin ang paglilinis bago ang bagong pagsusuri.',
      'frame_mismatch': 'Hindi tumugma ang aktwal na frame sa target at phase na ito. Tapusin ang paglilinis.',
      'continuity':
          'Hindi nakumpirma ang limitadong sekwensya ng kontroladong refresh. Hindi ito resulta ng frame rate.',
      'main_changed': 'Nagbago ang mga sample ng MAIN; maaaring kasama rito ang mga aksyon ng user. Tapusin ang paglilinis. Hindi nito natutukoy ang sanhi.',
      'main_unchanged': 'Walang nakitang pagbabago sa mga hangganang punto ng sampling na ito. Hindi pa rin alam ang pang-aabala sa pagitan ng mga ito.',
      'main_incomplete': 'Hindi kumpleto ang mga sample ng MAIN. Hindi nila mapapatunayang walang pang-aabala.',
      'not_installed': 'Hindi kasama ang OCR sa self-check na ito. Hindi sinubok ang OCR.',
      'other': 'May natanggap na hindi kilalang resulta.',
    });
    return '$_temp0';
  }

  @override
  String get phoneSelfCheckTargetScope =>
      'Gumagamit ng ordinaryong pansamantalang display at nakapirming lokal na target para sa paglunsad, pagbasa ng tree at isang pag-tap ng button. Hindi sinusubok ang teksto, pag-scroll, screenshot at OCR. Maaari lang magtala ang MAIN ng naobserbahang pagkabigo, hindi kailanman pagpasa. Hindi nagpapatunay na nalikha ang display ang paglilinis lamang.';

  @override
  String get phoneSelfCheckProfileChoice => 'Piliin ang susunod na pagsusuri (hindi binabago ang ulat sa ibaba)';

  @override
  String phoneSelfCheckProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'probe_b': 'Pagsusuri ng input receiver (B)',
      'target_c1': 'Pagsusuri ng nakapirming target (C1)',
      'target_c2': 'Nakapirming input at mga frame (C2)',
      'other': 'Hindi kilalang profile',
    });
    return '$_temp0';
  }

  @override
  String phoneSelfCheckReportProfile(String profile) {
    String _temp0 = intl.Intl.selectLogic(profile, {
      'probe_b': 'Profile ng ulat: input receiver (B)',
      'target_c1': 'Profile ng ulat: nakapirming target (C1)',
      'target_c2': 'Profile ng ulat: nakapirming input at mga frame (C2)',
      'other': 'Profile ng ulat: hindi nakumpirma',
    });
    return '$_temp0';
  }

  @override
  String get phoneSelfCheckTargetC2Scope =>
      'Gumagamit ng nakapirming lokal na target para sa paglunsad, pagbasa ng tree, isang pag-tap ng button, ASCII at Chinese na ACTION_SET_TEXT na pagpapalit/pagbabasa muli, lokal na pattern capture at limitadong kontroladong refresh. Hindi nito sinusukat ang FPS o kinis. Hindi mapapatunayan ng mga hangganang sample ng MAIN na walang pang-aabala sa pagitan ng mga sample. Hindi sinusubok ang OCR, pagtanggap ng touch, pag-scroll at back. Hindi nagpapatunay na nalikha ang display ang paglilinis lamang.';

  @override
  String phoneTaskWaiting(int taskId) {
    return 'Gawain $taskId · Naghihintay ng mga resource';
  }

  @override
  String phoneTaskWaitingApp(String packageName, int seconds) {
    return 'Naghihintay sa app na $packageName · $seconds segundo na ang lumipas.';
  }

  @override
  String phoneTaskWaitingUnknown(int seconds) {
    return 'Naghihintay sa interface (hindi nakumpirma ang pagkakakilanlan ng app) · $seconds segundo na ang lumipas.';
  }

  @override
  String phoneTaskWaitingScreen(String screen, int seconds) {
    return 'Naghihintay sa $screen · $seconds segundo na ang lumipas.';
  }

  @override
  String get phoneTaskMainResource => 'pangunahing screen';

  @override
  String get phoneTaskBackgroundResource => 'background screen';

  @override
  String get phoneInterruptionTitle => 'Hindi nakumpirmang natapos ang mga nakaraang gawain sa telepono';

  @override
  String get phoneInterruptionLoading => 'Binabasa ang mga talaan ng naantalang gawain…';

  @override
  String get phoneInterruptionStorageError =>
      'Hindi ma-save o mabasa ang mga talaan ng pagtatapos ng gawain. Subukang muli; hindi ito nangangahulugang napalaya ang mga background resource.';

  @override
  String phoneInterruptionHint(int count) {
    return '$count gawain ang naantala o hindi nai-save ang pagtatapos. Maaaring naisagawa na ang mga aksyon. Suriin muna. Ang pag-acknowledge ay kumukumpirma lang na nakita mo ang abisong ito; hindi nito ipinagpapatuloy ang mga aksyon o pinatutunayang napalaya ang mga background resource.';
  }

  @override
  String get phoneInterruptionAcknowledge => 'Nasuri ko ang abiso ng pagkaantala';

  @override
  String get phoneInterruptionRetry => 'Subukang i-save o basahin muli';

  @override
  String get phoneInterruptionActionFailed => 'Hindi pa nakumpirma ang mga talaan ng gawain. Subukang muli.';

  @override
  String get phoneLocalOcrTitle => 'On-device na text recognition (ML Kit)';

  @override
  String get phoneLocalOcrUnknown => 'Hindi mabasa ang setting na ito. I-refresh at subukang muli.';

  @override
  String get phoneLocalOcrDisclosure =>
      'Tumatakbo ang recognition sa device na ito. Hindi ipinapadala sa Google ang mga screenshot at teksto; kumokolekta ang SDK ng Google ng mga estadistika ng paggamit tulad ng model ng device, bersyon ng app at oras ng pagproseso.';

  @override
  String get phoneLocalOcrDetails =>
      'Naka-enable bilang default. Habang naka-off, hindi nag-trigger ng pag-load o pag-initialize ng SDK ang mga request ng text recognition. Hiwalay na ini-initialize ng remote pairing ang shared SDK kapag nagbukas ang scanner nito; hindi nito ine-enable ang text recognition. Maaaring ipadala sa iyong naka-configure na model ang mga screenshot at nakilalang teksto. Pinipigilan ng pag-off ang bagong lokal na recognition; maaaring matapos pa rin ang gawaing nasimulan na. Hindi nito ina-uninstall ang SDK o nangangakong i-clear o ihinto ang pagpapadala ng dating naipong estadistika ng SDK.';

  @override
  String get phoneBackgroundParallelTitle => 'Limitasyon ng background task';

  @override
  String phoneBackgroundParallelStatus(int configured, int effective, int held) {
    return 'Naka-configure: $configured · Available na limitasyon: $effective · Okupado: $held';
  }

  @override
  String get phoneBackgroundParallelDescription =>
      'Pinananatili ng mas mababang limitasyon ang mga umiiral na gawain. Naghihintay pa rin ang mga bagong gawain sa pagiging available ng mga app at pangunahing screen.';

  @override
  String phoneBackgroundParallelChoice(int limit) {
    return '$limit background task slot';
  }

  @override
  String get phoneBackgroundParallelOff =>
      'Naka-off ang background channel. Hindi ito ino-on ng pag-save ng kagustuhang ito.';

  @override
  String get phoneBackgroundParallelUnsupported => 'Hindi available ang background operation sa device na ito.';

  @override
  String get phoneBackgroundParallelConnection =>
      'Kailangan ng koneksyon bago makapagsimula ng bagong background task.';

  @override
  String get phoneBackgroundParallelBusy =>
      'Inihahanda o pinapanatili ang background channel. Hindi pa makapagsimula ang mga bagong gawain.';

  @override
  String get phoneBackgroundParallelRecovery =>
      'Lutasin ang hindi natapos na background resource recovery bago magsimula ng mga bagong gawain.';

  @override
  String get phoneBackgroundParallelPeer =>
      'Hindi sinusuportahan ng nakakonektang serbisyo ang mga kinakailangang background capability.';

  @override
  String get phoneBackgroundParallelSerial =>
      'Sumusuporta ang koneksyong ito ng isang background slot. Nananatiling naka-save ang iyong kagustuhan.';

  @override
  String get phoneSkillBundlePublishedUnverified =>
      'Nailathala ang mga file, ngunit hindi pa nagtagumpay ang buong verification. Huwag mag-save muli.';

  @override
  String get phoneSkillBundleUnknown =>
      'Hindi nakumpirma ang resulta ng pag-save. Maaaring naisulat na ang mga file. Huwag mag-save muli.';

  @override
  String phoneSkillBundleRevision(String revision) {
    return 'Rebisyon ng ruta: $revision';
  }

  @override
  String get phoneSkillReplayReview => 'Suriin ang ruta ng telepono';

  @override
  String get phoneSkillReplaySourceChanged =>
      'Nagbago ang lokal na session o koneksyon. Piliing muli ang ruta mula sa kasalukuyang lokal na usapan.';

  @override
  String get phoneSkillReplayUnavailable =>
      'Hindi available para sa kontroladong pagpapatupad sa telepono na ito ang rutang ito. Nananatiling available ang ordinaryong skill template.';

  @override
  String get phoneSkillReplayConfirm => 'Nasuri ko ang rutang ito at ang app na napili para sa paggamit na ito.';

  @override
  String get phoneSkillReplayToComposer => 'Ipasok sa usapang ito';

  @override
  String phoneSkillReplayStartText(String request) {
    return 'Napili at nasuri nang lokal ang isang ruta ng telepono. Tawagin lang ang mcp__phone__replay gamit ang $request. Kung hindi available o tinanggihan, ibalik sa user/model; huwag i-replay bilang ordinaryong aksyon.';
  }

  @override
  String get phoneSkillReplayQueue => 'Ipadala ang ruta (ipila)';

  @override
  String get phoneSkillReplayQueued =>
      'Tinanggap o inilagay sa pila ang mensahe ng ruta. Hindi ito nangangahulugang matagumpay na naisagawa ang ruta.';

  @override
  String get phoneSkillReplaySendUncertain =>
      'Hindi nakumpirma ang paghahatid ng mensahe ng ruta. Hindi pa ito inihanda o ni-replay muli. Suriin ang orihinal na usapan.';

  @override
  String get phoneTaskResultReady => 'Tapos na ang gawain · Tingnan ang resulta';

  @override
  String get phoneTaskEndedResult => 'Natapos ang gawain · Tingnan ang resulta';

  @override
  String get phoneBackgroundGuideTitle => 'Mga kumpirmasyon at pagbabalik';

  @override
  String get phoneBackgroundGuideSubtitle => 'Makita agad ang mga kumpirmasyon at resulta ng gawain';

  @override
  String get phoneBackgroundGuideBody =>
      'Kapag kailangan ng desisyon mo ang isang hakbang, lalabas ang isang card ng JDK-Go. Kung hindi available ang card, susubukan ng app ang isang notification o babalik dito. Payagan ang mga notification ng phone-control at mga pop-up alert sa system settings.';

  @override
  String get phoneBackgroundOemHint =>
      'Sa mga system permission ng JDK-Go, lagyan ng check ang “Display pop-up windows while running in the background”, kung available. Makakatulong ang pagpayag dito para awtomatikong makabalik ang app. Nag-iiba ang mga pangalan ng menu ayon sa bersyon ng system.';

  @override
  String get phoneBackgroundReturnHint =>
      'Kung hindi bumabalik ang app kapag natapos ang gawain, i-tap ang “Tapos na ang gawain · Tingnan ang resulta”. Kung naka-block ang mga system notification o background window, maaaring kailanganin mong buksan mismo ang JDK-Go.';

  @override
  String get phoneBackgroundGotIt => 'Naintindihan ko';

  @override
  String get phoneBackgroundOpenSettings => 'Buksan ang system settings';

  @override
  String get phoneBackgroundNotificationBlocked =>
      'Payagan ang mga pop-up alert para sa mga notification ng phone-control';

  @override
  String get phonePrivilegedUpgrade =>
      'Hindi sinusuportahan ng build ng app na ito ang privileged channel na iyon. I-update ang JDK-Go para magamit ito.';

  @override
  String get phonePrivilegedSui => 'Sui';

  @override
  String get phonePrivilegedRoot => 'Root';

  @override
  String get phonePrivilegedSuiDescription =>
      'Gamitin ang interface ng Sui module. Hinihingi lang ang awtorisasyon kapag nag-tap ka.';

  @override
  String get phonePrivilegedRootDescription =>
      'Para sa Magisk, KernelSU o APatch. Tatakbo lang ang unang root command pagkatapos mong piliin ang channel na ito.';

  @override
  String get phonePrivilegedRootPrepare => 'I-authorize ang root';

  @override
  String get phonePrivilegedRootUnchecked => 'Hindi pa nasusuri';

  @override
  String get phonePrivilegedGrantRoot => 'Ipagkaloob gamit ang root';

  @override
  String get phonePrivilegedGrantSui => 'Ipagkaloob gamit ang Sui';

  @override
  String get phonePrivilegedGrantSuiPermission => 'I-authorize ang Sui, saka ipagkaloob';

  @override
  String get phonePrivilegedSuggested => 'Iminumungkahi';

  @override
  String get phonePrivilegedRootRiskTitle => 'Bigyan ng root access ang JDK-Go?';

  @override
  String get phonePrivilegedRootRiskBody =>
      'Itatanong ito ng iyong root manager (Magisk, KernelSU o APatch). Kung papayagan mo, patatakbuhin ng JDK-Go ang sarili nitong background service bilang root. Kusa lang itong magtatanong muli pagkatapos ng pagkaputol o restart kapag naka-on ang “Panatilihin ang root channel”.';

  @override
  String get phoneGateCleanupTitle => 'Hindi kumpirmado ang paglilinis ng probe';

  @override
  String get phoneGateCleanupUnknown =>
      'Naka-block ang mga bagong background resource. Subukan lang muli ang orihinal na paglilinis kung available pa ang channel nito. Hindi nito muling pinapatakbo ang probe.';

  @override
  String get phoneGateCleanupRunning =>
      'Hinihintay ang orihinal na probe at ang paglilinis nito. Mananatiling naka-pin ang channel hanggang makumpirma ang paglilinis.';

  @override
  String get phoneGateCleanupRetry => 'Subukan lang muli ang paglilinis';

  @override
  String get phoneGateCleanupDone =>
      'Kumpirmado ang paglilinis. Piliin muli nang tahasan ang channel para magpatakbo ng bagong pagsusuri.';

  @override
  String get phoneGateRetest => 'Suriin muli ang channel na ito';

  @override
  String phoneKeepTitle(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'Panatilihin ang Shizuku channel',
      'sui': 'Panatilihin ang Sui channel',
      'root': 'Panatilihin ang root channel',
      'adb': 'Panatilihin ang Direct ADB channel',
      'other': 'Panatilihin ang channel na ito',
    });
    return '$_temp0';
  }

  @override
  String get phoneKeepRootDescription =>
      'Pagkatapos ng pagkaputol, pag-restart ng app o reboot, kusang magtatanong muli ang JDK-Go sa iyong root manager. Ang manager pa rin ang magpapasya.';

  @override
  String get phoneKeepSharedDescription =>
      'Pagkatapos ng pagkaputol, pag-restart ng app o reboot, muling kumokonekta ang JDK-Go gamit ang pahintulot na mayroon na ito. Hindi ito kailanman humihingi ng pahintulot.';

  @override
  String get phoneKeepAdbDescription =>
      'Pagkatapos ng pagkaputol, pag-restart ng app o reboot, muling kumokonekta ang JDK-Go sa Wi‑Fi gamit ang umiiral na pairing. Sa pahintulot mula sa “Awtomatikong ibalik ang accessibility”, sinusubukan din nitong buksan nang isang beses ang wireless debugging.';

  @override
  String get phoneKeepRestoring => 'Muling kumokonekta';

  @override
  String get phoneKeepWaiting => 'Hinihintay ang channel';

  @override
  String get phoneKeepWaitingService => 'Hinihintay na tumakbo ang serbisyo';

  @override
  String get phoneKeepWaitingPermission => 'Hindi awtorisado. Muling kokonekta kapag ipinagkaloob mo.';

  @override
  String get phoneKeepWaitingNetwork => 'Hinihintay ang Wi‑Fi';

  @override
  String get phoneKeepNotPaired => 'Hindi naka-pair. I-pair muna ang wireless debugging.';

  @override
  String get phoneKeepFailed =>
      'Hindi makakonekta muli. Susubukan ulit kapag binuksan mo ang app o nagsimula ng gawain.';

  @override
  String get phoneResourceRecoveryTitle => 'Kailangang i-verify ang mga background resource';

  @override
  String get phoneResourceRecoveryRunning =>
      'Sinusuri ang orihinal na mga talaan ng resource. Maghihintay ang mga bagong gawain sa telepono hanggang matapos ito.';

  @override
  String get phoneResourceRecoveryStorage =>
      'Hindi mabasa o ma-save ang talaan ng resource. Subukang i-save o basahin muli. Hindi inuulit ang kumpirmadong pagpapalaya, at hindi muling pinapatakbo ang mga nakaraang aksyon.';

  @override
  String get phoneResourceRecoveryPending =>
      'Hindi pa na-verify ang mga lumang background resource. Naka-block ang mga bagong gawain sa telepono. Piliin ang orihinal na awtorisadong channel at subukang muli; kung hindi pa rin available ang verification, i-restart ang device at suriin muli. Maaaring naisagawa na ang mga nakaraang aksyon. Hindi nililinis ng pagbasa sa abiso ng pagkaantala ng gawain ang mga resource na ito.';

  @override
  String get phoneResourceRecoveryRetry => 'Subukang muli ang resource verification';

  @override
  String get phoneSkillSectionTitle => 'Mga natapos na gawain at skill';

  @override
  String get phoneSkillAskAfterSuccess => 'Magtanong na mag-save ng skill pagkatapos ng matagumpay na gawain';

  @override
  String get phoneSkillAskAfterSuccessHint =>
      'Naka-off bilang default. Magtatanong nang isang beses ang bagong natapos na gawain habang nakikita ang pahinang ito. Maaari ka ring pumili ng gawain nang manu-mano.';

  @override
  String phoneSkillTask(int taskId, int steps) {
    return 'Gawain $taskId · $steps hakbang';
  }

  @override
  String get phoneSkillCandidateHint =>
      'Suriin muna ang aktwal na resulta; hindi nagpapatunay na naabot ang layunin mo ang matagumpay na tool call.';

  @override
  String get phoneSkillSaveAction => 'I-save bilang skill';

  @override
  String get phoneSkillConfirmGoal => 'Naabot ba ng gawaing ito ang layunin mo?';

  @override
  String get phoneSkillConfirmGoalBody =>
      'Suriin ang aktwal na resulta. Ang kumpirmasyon mo ay lilikha ng draft na maaari mong suriin at i-edit bago mag-save.';

  @override
  String get phoneSkillGoalDone => 'Naabot ang layunin · Suriin ang draft';

  @override
  String get phoneSkillPrivacyHint =>
      'Nananatili sa device na ito ang draft. Huwag maglagay ng mga password, key o verification code. Sa bersyong ito, nagiging mga parameter ang free text; pinananatili ang pag-aalis o pag-aayos muli ng mga hakbang. Suriin ang huling preview.';

  @override
  String get phoneSkillGoal => 'Layunin';

  @override
  String get phoneSkillPrerequisites => 'Mga kinakailangan (app, bersyon, estado ng sign-in)';

  @override
  String phoneSkillStep(int number) {
    return 'Orihinal na hakbang $number';
  }

  @override
  String get phoneSkillCheckpoint => 'Ano ang dapat lumitaw pagkatapos ng hakbang na ito';

  @override
  String get phoneSkillMoveUp => 'Itaas ang hakbang';

  @override
  String get phoneSkillMoveDown => 'Ibaba ang hakbang';

  @override
  String get phoneSkillUpdatePreview => 'I-update ang redacted na preview';

  @override
  String get phoneSkillPreviewTitle => 'Kumpletong nilalamang ise-save';

  @override
  String get phoneSkillParameterizedHint =>
      'Pinalitan ng mga parameter ang free text na dapat punan at suriin kapag ginagamit ang skill na ito.';

  @override
  String get phoneSkillFinalConfirmation =>
      'Nasuri ko ang kumpletong kasalukuyang preview at sumasang-ayon akong i-save ang bersyong ito.';

  @override
  String get phoneSkillSavedBody =>
      'Naisulat ang file sa lokal na skills directory. Hindi pa na-verify ang na-refresh na listahan ng skill ng engine; tingnan ang pahina ng Skills.';

  @override
  String get phoneSkillWriting => 'Isinusulat ang skill';

  @override
  String get phoneSkillCannotCancel =>
      'Maaaring umabot na sa yugto ng commit ang pagsulat at hindi garantisadong makakansela. Pahina lang ang isinasara ng pagsasara; ise-save pa rin ang naka-commit na file.';

  @override
  String get phoneSkillKeepWaiting => 'Magpatuloy sa pagtingin';

  @override
  String get phoneSkillCheckWrite => 'Suriin ang resulta ng pagsulat';

  @override
  String get phoneSkillStale => 'Hindi na kasalukuyan ang draft na ito. Isara ito at piliin muli ang gawain.';

  @override
  String get phoneSkillSensitive => 'May sensitibong nilalaman ang edit. Alisin ito bago i-update ang preview.';

  @override
  String get phoneSkillInvalid =>
      'Lumampas sa mga limitasyon ang edit o pagkakasunod-sunod ng hakbang. Paikliin ang teksto at magtira ng kahit isang hakbang.';

  @override
  String get phoneSkillWriteFailed =>
      'Hindi maisulat ang file. Suriin ang lokal na runtime at storage; i-edit at i-update ang preview bago kumpirmahin ang isa pang pag-save.';

  @override
  String get phoneSkillUnavailable =>
      'Hindi available ang mga draft ng skill. Suriin ang estado ng lokal na engine at subukang muli.';

  @override
  String get phoneModeTitle => 'Paano nagkukumpirma ang JDK';

  @override
  String get phoneModeMessage => 'Maaari mo itong baguhin sa Settings anumang oras';

  @override
  String get phoneModeAsk => 'Tanungin ako sa mga pangunahing hakbang';

  @override
  String get phoneModeAskHint => 'Bago ang bagong app, pagpapadala, pagbura o pagbabayad';

  @override
  String get phoneModeAuto => 'Ganap na awtomatiko';

  @override
  String get phoneModeAutoHint => 'Hindi kailanman nagtatanong, hindi kailanman nang-iistorbo';

  @override
  String get phoneModeAutoNoteTitle => 'Ang mga ito ay mananatili sa iyo';

  @override
  String get phoneModeAutoNote =>
      'Mananatili sa iyo ang system settings at mga pahina ng pahintulot, mga password at verification code, at ang JDK-Go mismo. Bawal bilang default ang mga app ng bangko at pagbabayad; maaari mo itong baguhin sa Settings.';

  @override
  String get phoneModeAutoUnlockNote =>
      'Para hayaan ang AI na humawak ng system settings, mga password at iba pa, i-on ito sa Settings › Phone control › Lift limits.';

  @override
  String get phoneModeConfirmAuto => 'Maging ganap na awtomatiko';

  @override
  String get phoneYoursTitle => 'Ang mga ito ay mananatili sa iyo';

  @override
  String get phoneYoursSystem => 'System settings at mga pahina ng pahintulot';

  @override
  String get phoneYoursSecrets => 'Mga password at verification code';

  @override
  String get phoneYoursOwnApp => 'Ang JDK-Go mismo';

  @override
  String get phoneYoursDenyList =>
      'Mga app na nakatakda sa Hands off sa App rules, bangko at pagbabayad bilang default';

  @override
  String get phoneUnlockTitle => 'Alisin ang mga limitasyon';

  @override
  String get phoneUnlockSubtitle => 'Hayaang gawin ng AI ang mga bagay na sa iyo bilang default';

  @override
  String get phoneUnlockSystem => 'System settings';

  @override
  String get phoneUnlockSystemHint => 'Mga pahintulot, installer, security center, mga notification';

  @override
  String get phoneUnlockSecrets => 'Mga password at code';

  @override
  String get phoneUnlockSecretsHint => 'Maglagay ng mga password, verification at payment code';

  @override
  String get phoneUnlockOwnApp => 'Ang JDK-Go mismo';

  @override
  String get phoneUnlockOwnAppHint => 'Mag-tap at mag-type sa loob ng JDK-Go';

  @override
  String get phoneUnlockBusy => 'Hindi maaaring i-on habang may tumatakbong gawain';

  @override
  String get phoneUnlockFootnote =>
      'Kapag naka-on, sa iyo na ang mga kahihinatnan. I-on lang kapag kailangan, at i-off kapag tapos na.';

  @override
  String get phoneUnlockBanks => 'Mga app ng bangko at pagbabayad';

  @override
  String get phoneUnlockBanksHint => 'Baguhin sa App rules';

  @override
  String get phoneUnlockNone => 'Walang naka-on';

  @override
  String phoneUnlockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count ang naka-on', one: '1 ang naka-on');
    return '$_temp0';
  }

  @override
  String get phoneUnlockedBadge => 'Inalis ang mga limitasyon';

  @override
  String get phoneUnlockConfirmSystemTitle => 'Hayaang patakbuhin ng AI ang system settings?';

  @override
  String get phoneUnlockConfirmSecretsTitle => 'Hayaang maglagay ang AI ng mga password at code?';

  @override
  String get phoneUnlockConfirmOwnAppTitle => 'Hayaang patakbuhin ng AI ang JDK-Go mismo?';

  @override
  String get phoneUnlockCanTitle => 'Kapag naka-on, magagawa ng AI ang';

  @override
  String get phoneUnlockRiskTitle => 'Ano ang maaaring magkamali';

  @override
  String get phoneUnlockDisclaimerTitle => 'Disclaimer';

  @override
  String get phoneUnlockSystemCan1 =>
      'Buksan at baguhin ang system settings, kasama ang mga pahintulot, accessibility at developer options';

  @override
  String get phoneUnlockSystemCan2 => 'Mag-install, mag-update o mag-uninstall ng mga app sa installer';

  @override
  String get phoneUnlockSystemCan3 =>
      'Mag-tap sa security center at sa notification shade, kasama ang mga button sa mga notification';

  @override
  String get phoneUnlockSystemRisk1 =>
      'Maaaring udyukan ng mga malisyosong tagubilin sa web page, mensahe o file ang AI na patayin ang mga proteksyon, magbigay ng mga pahintulot sa ibang app o mag-install ng mga app';

  @override
  String get phoneUnlockSystemRisk2 =>
      'Ikaw ang magbabalik ng mga setting ng network, account o seguridad na nabago nang hindi sinasadya';

  @override
  String get phoneUnlockSecretsCan1 => 'Mag-type sa mga field ng password, verification-code at payment-code';

  @override
  String get phoneUnlockSecretsCan2 =>
      'Gamitin ang mga code na nakikita nito sa mga chat, text o notification para mag-sign in o mag-verify';

  @override
  String get phoneUnlockSecretsCan3 => 'Nagpapakita ang action log ng •••• at hindi kailanman ang tinype';

  @override
  String get phoneUnlockSecretsRisk1 =>
      'Maaaring udyukan ng mga malisyosong tagubilin ang AI na maglagay ng code sa ibang lugar, na magpapapasok sa iba sa iyong account';

  @override
  String get phoneUnlockSecretsRisk2 => 'Maaari nitong kumpletuhin ang pagbabayad o paglilipat na hindi mo sinadya';

  @override
  String get phoneUnlockOwnAppCan1 => 'Mag-tap at mag-type sa loob ng JDK-Go, kasama ang pagbabago ng mga setting';

  @override
  String get phoneUnlockOwnAppCan2 => 'Magbasa ng mga usapan at setting sa mga screen ng JDK-Go';

  @override
  String get phoneUnlockOwnAppRisk1 =>
      'Maaaring udyukan ng mga malisyosong tagubilin ang AI na aprubahan ang sarili nitong mga kahilingan o patayin ang mga kumpirmasyon';

  @override
  String get phoneUnlockOwnAppRisk2 => 'Ipinapadala sa model ang nasa mga screen na ito';

  @override
  String get phoneUnlockDisclaimer1 => 'Kapag naka-on, magagawa ng AI ang nasa itaas nang walang nagkukumpirma.';

  @override
  String get phoneUnlockDisclaimer2 => 'Maaaring malinlang ang AI ng nilalaman sa mga web page, mensahe o file.';

  @override
  String get phoneUnlockDisclaimer3 =>
      'Anumang pagkawala sa iyong mga account, pera, data o device na magreresulta ay pasan mo. Walang pananagutan ang JDK-Go at ang mga developer nito.';

  @override
  String get phoneUnlockDisclaimer4 => 'I-on lang kapag kailangan mo, at i-off kapag tapos ka na.';

  @override
  String get phoneUnlockDisclaimer5 =>
      'Pinapayuhan naming huwag itong i-on sa device na may impormasyon sa pagbabayad o bangko.';

  @override
  String get phoneUnlockHold => 'Naiintindihan ko ang mga panganib, i-on';

  @override
  String get phoneUnlockHoldHint => 'Pindutin at hawakan nang humigit-kumulang 1.5 segundo';

  @override
  String phoneUnlockOnNotice(String name) {
    return 'Naka-on ang “$name”';
  }

  @override
  String phoneUnlockOffNotice(String name) {
    return 'Naka-off ang “$name”';
  }

  @override
  String get searchKwPhoneUnlock =>
      'lift limits,unlock,passwords,codes,system settings,itself,risk,disclaimer,alisin ang limitasyon,password,panganib';

  @override
  String get pluginConfigUnsaved => 'Hindi pa na-save';

  @override
  String get pluginConfigSecretSet => 'Nakatakda';

  @override
  String get pluginConfigAdvanced => 'Advanced';

  @override
  String get pluginConfigSearchHint => 'Maghanap ng mga setting';

  @override
  String get pluginConfigNoMatch => 'Walang tumutugmang setting';

  @override
  String get pluginConfigOpenWeb => 'I-set up sa web';

  @override
  String get pluginConfigOpenWebHint => 'Ang sariling pahina ng plugin';

  @override
  String get pluginConfigResetAll => 'I-reset lahat sa default';

  @override
  String get pluginConfigResetAllTitle => 'I-reset lahat sa default?';

  @override
  String get pluginConfigReset => 'I-reset';

  @override
  String pluginConfigChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count pagbabago', one: '1 pagbabago');
    return '$_temp0';
  }

  @override
  String get pluginConfigAppliesOnReload => 'Magre-reload ang plugin kapag nag-save';

  @override
  String get pluginConfigSaving => 'Sine-save…';

  @override
  String get pluginConfigReloading => 'Nire-reload…';

  @override
  String get pluginConfigApplied => 'Nailapat';

  @override
  String get pluginConfigFailed => 'Hindi umepekto';

  @override
  String get pluginConfigRestored => 'Naibalik ang mga naunang setting';

  @override
  String get pluginConfigStopped => 'Hindi umepekto, at hindi maibalik ang mga naunang setting';

  @override
  String get pluginConfigRestore => 'Ibalik';

  @override
  String get pluginConfigDiscard => 'Itapon';

  @override
  String get pluginConfigNotStarted => 'Hindi nagsimula ang plugin';

  @override
  String get pluginConfigNone => 'Walang itatakda';

  @override
  String get pluginConfigInvalidOperation => 'Hindi mailalapat ang pagbabagong ito';

  @override
  String get pluginConfigGone => 'Hindi na tumatakbo ang plugin. Na-refresh.';

  @override
  String get pluginConfigUnknown => 'Nawala ang koneksyon. Na-reload ang mga setting.';

  @override
  String get pluginConfigUnsupported => 'Hindi pa maitatakda rito';

  @override
  String get pluginConfigSecretUnbound => 'Kailangan ng suporta ng plugin';

  @override
  String get pluginConfigListFailed => 'Hindi mabasa ang listahan ng plugin. Subukang muli mamaya.';

  @override
  String get pluginConfigListUpdating => 'Ina-update ang listahan ng plugin. Subukang muli sa ilang sandali.';

  @override
  String get pluginConfigFixed => 'Itinakda ng configuration file';

  @override
  String get pluginConfigFixedNote => 'Itinakda ng isang configuration file. Tingnan lang dito.';

  @override
  String get pluginConfigReadOnly => 'Read-only';

  @override
  String pluginConfigEntryTitle(String bundle, String entry) {
    return '$bundle · $entry';
  }

  @override
  String get pluginConfigNameSpeechToText => 'Speech recognition';

  @override
  String get pluginConfigNameSenseVoice => 'SenseVoice recognition';

  @override
  String get pluginConfigNameSpeechApi => 'Transcription API';

  @override
  String get pluginConfigNameTranslator => 'Serbisyo sa pagsasalin';

  @override
  String get pluginConfigNameSessionIndex => 'Session index';

  @override
  String get pluginConfigNameSessionSearchTool => 'Tool sa paghahanap ng session';

  @override
  String get pluginConfigNameTerminalService => 'Serbisyo ng terminal';

  @override
  String get pluginConfigNameTerminalBash => 'Bash terminal';

  @override
  String get pluginConfigNameTerminalPwsh => 'PowerShell terminal';

  @override
  String get pluginConfigNameTerminalTools => 'Mga tool ng terminal';

  @override
  String get pluginConfigNameWorktree => 'Worktree manager';

  @override
  String get pluginConfigNameWorktreeTools => 'Mga tool ng worktree';

  @override
  String get pluginConfigNameRalphWorkflow => 'Workflow engine';

  @override
  String get pluginConfigNameRalphTools => 'Mga tool ng Ralph';

  @override
  String get plugInputRequired => 'Kumpletuhin ang field na ito';

  @override
  String get plugInputInvalidValue => 'Di-wastong halaga';

  @override
  String get plugInputNumber => 'Maglagay ng wastong numero';

  @override
  String plugInputBounds(String min, String max) {
    return 'Maglagay ng halagang mula $min hanggang $max';
  }

  @override
  String plugInputLength(int min, int max) {
    return 'Gumamit ng $min–$max na karakter';
  }

  @override
  String get plugInputPattern => 'Suriin ang format';

  @override
  String get plugInputDate => 'Pumili ng wastong petsa';

  @override
  String get plugInputTime => 'Pumili ng wastong oras';

  @override
  String get plugInputUnavailable => 'Hindi sinusuportahan dito ang component na ito';

  @override
  String get plugInputNoPassword => 'Hindi maaaring gumamit ng password field ang mga plugin';

  @override
  String get plugInputBadBinding => 'Ang input binding ay dapat field path sa ilalim ng data';

  @override
  String get plugInputDuplicateBinding => 'Isang input lang ang maaaring i-bind ng bawat field';

  @override
  String get plugInputNamedPattern => 'Gumamit ng built-in na validation pattern';

  @override
  String get plugInputNestedForm => 'Hindi maaaring i-nest ang mga form';

  @override
  String get plugInputSubmitMissing => 'Kailangan ng submit action ang form';

  @override
  String get plugInputTooLarge => 'Masyadong marami ang nilalaman. Paikliin at subukang muli';

  @override
  String get plugInputCheckFields => 'Suriin ang mga naka-highlight na field';

  @override
  String get plugInputFailed => 'Hindi na-save. Subukang muli';

  @override
  String get plugInputSubmit => 'I-save';

  @override
  String get plugInputChoose => 'Pumili';

  @override
  String get plugInputPrevious => 'Nakaraan';

  @override
  String get plugInputNext => 'Susunod';

  @override
  String plugInputDecrease(String label) {
    return 'Bawasan ang $label';
  }

  @override
  String plugInputIncrease(String label) {
    return 'Dagdagan ang $label';
  }

  @override
  String plugInputRating(String label, int value, int max) {
    return '$label: $value sa $max';
  }

  @override
  String get plugInputFormula => 'Di-wastong formula o lumampas sa limitasyon ng formula';

  @override
  String get plugInputDatePicker => 'Petsa ng plugin';

  @override
  String get plugInputTimePicker => 'Oras ng plugin';

  @override
  String get plugInputChoices => 'Mga pagpipilian ng plugin';

  @override
  String get plugInputGestureRequired => 'Nangangailangan ng pag-tap ng user ang epektong ito';

  @override
  String get pluginsOperationHostChanged => 'Nagbago ang host — walang ginawa';

  @override
  String get pluginsReloadLocal => 'I-restart ang engine para mag-reload';

  @override
  String get pluginsReloadInterrupts => 'Puputulin ang mga tumatakbong gawain';

  @override
  String pluginsReloadConfirm(String name) {
    return 'I-reload ang “$name”?';
  }

  @override
  String get pluginsReloadExplanation =>
      'Ire-restart nito ang lokal na engine at ire-reload ang mga plugin. Puputulin ang mga tumatakbong gawain.';

  @override
  String get pluginsReloadProceed => 'I-restart at i-reload';

  @override
  String get pluginsReloadRequested => 'Hiniling ang pag-restart ng engine';

  @override
  String get pluginsReloadChanged => 'Nagbago ang host o ang estado ng plugin. Subukang muli.';

  @override
  String get pluginsReloadFailed => 'Hindi ma-restart ang engine. Suriin ang mga log nito.';

  @override
  String get pluginsFile => 'File';

  @override
  String get pluginsChat => 'Chat';

  @override
  String get pluginsImage => 'Larawan';

  @override
  String get pluginsNamespaceDefaultModel => 'Default na model';

  @override
  String get pluginsNamespaceDefaultPreset => 'Default na preset';

  @override
  String get pluginsNamespaceAgent => 'Agent';

  @override
  String get pluginsNamespaceSubagent => 'Subagent';

  @override
  String get pluginsNamespaceSubagentModels => 'Mga model ng subagent';

  @override
  String get pluginsNamespaceDeepSeekModel => 'DeepSeek model';

  @override
  String get pluginsNamespaceAccountModel => 'DeepSeek account model';

  @override
  String get pluginsNamespaceCustomModels => 'Custom na serbisyo ng model';

  @override
  String get pluginsNamespaceNetwork => 'Access sa internet';

  @override
  String get pluginsNamespaceWebSearch => 'Paghahanap sa web';

  @override
  String get pluginsNamespaceSearchApi => 'Web search API';

  @override
  String get pluginsNamespaceCommands => 'Pagpapatupad ng command';

  @override
  String get pluginsNamespacePermissions => 'Mga pahintulot';

  @override
  String get pluginsNamespaceChatLog => 'Chat log';

  @override
  String get pluginsNamespaceThinkingTranslation => 'Pagsasalin ng pag-iisip';

  @override
  String get pluginsNamespaceTranslation => 'Pagsasalin';

  @override
  String get pluginsNamespaceLanguage => 'Wika';

  @override
  String get pluginsNamespaceWebAppearance => 'Hitsura ng web';

  @override
  String get pluginsNamespaceWebChat => 'Web chat';

  @override
  String get pluginsNamespaceWebInput => 'Web input';

  @override
  String get pluginsNamespaceWebSettings => 'Mga setting ng web';

  @override
  String get pluginsNamespaceWebGeneral => 'Pangkalahatang web';

  @override
  String get pluginsNamespaceAutoReview => 'Auto review';

  @override
  String get pluginsNamespaceAgentTeam => 'Agent team';

  @override
  String get pluginsNamespaceVoiceInput => 'Voice input';

  @override
  String get pluginsOfficialPlugin => 'Opisyal na plugin';

  @override
  String get pluginsLocalUnshareable => 'Na-install nang lokal, hindi maibabahagi';

  @override
  String pluginsIncludesPresets(String names) {
    return 'Kasama ang mga preset na “$names”';
  }

  @override
  String get pluginsSecretsUnshareable => 'May mga lihim, hindi maibabahagi';

  @override
  String pluginsLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linya', one: '1 linya');
    return '$_temp0';
  }

  @override
  String get pluginsEmptyValue => 'Walang laman';

  @override
  String get pluginsOnValue => 'Naka-on';

  @override
  String get pluginsOffValue => 'Naka-off';

  @override
  String get pluginsOfficialUnavailable => 'Walang opisyal na plugin na ito ang host na ito';

  @override
  String get pluginsEnabled => 'Naka-enable';

  @override
  String get pluginsVersionMismatch => 'Iba ang bersyon sa ibinahaging bersyon';

  @override
  String get pluginsCurrentVersion => 'Kasalukuyang bersyon';

  @override
  String get pluginsNewVersion => 'Bagong bersyon';

  @override
  String pluginsAddedWith(String title) {
    return 'Idinagdag kasama ang “$title”';
  }

  @override
  String pluginsApplyAfterInstall(String detail) {
    return 'Ilapat pagkatapos mag-install ng mga plugin · $detail';
  }

  @override
  String get pluginsSettingsReadFailed => 'Hindi mabasa ang mga setting ng host na ito';

  @override
  String get pluginsSettingUnavailable => 'Walang ganitong setting ang host na ito';

  @override
  String get pluginsSettingsReadOnly => 'Read-only ang mga setting ng host na ito';

  @override
  String get pluginsImportLocalOnly => 'Sa telepono na ito lang makakapag-import';

  @override
  String get pluginsReplaceSkill => 'Palitan ang skill na may parehong pangalan';

  @override
  String get pluginsReplaceContent => 'Palitan ang umiiral na nilalaman';

  @override
  String get pluginsSafeModeInstallBlocked => 'Hindi makapag-install ng mga plugin sa Safe mode';

  @override
  String get pluginsHostInstallBlocked => 'Hindi makapag-install ng mga plugin sa host na ito mula rito';

  @override
  String get pluginsInstallFailed => 'Nabigo ang pag-install';

  @override
  String get pluginsAfterRestart => 'Magkakabisa pagkatapos mag-restart';

  @override
  String get pluginsSettingsChanged => 'Kababago lang ng mga setting';

  @override
  String get pluginsWriteFailed => 'Hindi maisulat';

  @override
  String get pluginsHostUnreachable => 'Hindi maabot ang host';

  @override
  String get pluginsFileWriteFailed => 'Hindi maisulat ang file';

  @override
  String get pluginsProfileTitle => 'Mga setting ng JDK-Go';

  @override
  String get pluginsGistTokenInvalid => 'Di-wasto ang GitHub token o walang pahintulot sa Gist';

  @override
  String pluginsGistCreateHttpFailed(int status) {
    return 'Hindi malikha ang Gist (HTTP $status)';
  }

  @override
  String get pluginsGistCreateFailed => 'Hindi malikha ang Gist';

  @override
  String get pluginsGitHubUnreachable => 'Hindi maabot ang GitHub';

  @override
  String get pluginsGitHubTimeout => 'Nag-time out ang koneksyon sa GitHub';

  @override
  String get pluginsGistNotFound => 'Hindi nahanap ang Gist';

  @override
  String get pluginsGistNoProfile => 'Walang mga setting na maiimport ang Gist na ito';

  @override
  String get pluginsGistReadFailed => 'Hindi mabasa ang Gist';

  @override
  String get pluginsListReadFailed => 'Hindi mabasa ang listahan ng plugin';

  @override
  String get pluginsReadingPlugins => 'Binabasa ang mga plugin…';

  @override
  String get pluginsDshOfficial => 'Opisyal na JDK';

  @override
  String get pluginsOfficialToggleOnly =>
      'Maaari lang i-on o i-off ang mga opisyal na component, at nalalapat sa lahat ng chat sa host na ito';

  @override
  String get pluginsOfficial => 'Opisyal';

  @override
  String get pluginsNoThirdParty => 'Wala pang third-party na plugin';

  @override
  String get pluginsPluginsDescription => 'Magdagdag ng mga tool, alaala at model sa JDK';

  @override
  String get pluginsBrowseMarket => 'Mag-browse ng mga plugin';

  @override
  String get pluginsLoading => 'Nilo-load';

  @override
  String get pluginsIslandClosed => 'Nagsara ang interface ng plugin';

  @override
  String get pluginsReopen => 'Buksan muli';

  @override
  String pluginsOpenBrowserHost(String host) {
    return 'Buksan ang $host sa iyong browser?';
  }

  @override
  String get pluginsSearch => 'Maghanap ng mga plugin';

  @override
  String get pluginsMarketLoading => 'Nilo-load ang plugin directory…';

  @override
  String get pluginsMarketLoadFailed => 'Hindi mabuksan ang plugin directory';

  @override
  String get pluginsMarketInvalid => 'Di-wastong format ng directory';

  @override
  String get pluginsAll => 'Lahat';

  @override
  String pluginsMarketCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugin', one: '1 plugin');
    return '$_temp0 · mula sa dshfind';
  }

  @override
  String get pluginsHideWeb => 'Itago ang mga Web plugin';

  @override
  String pluginsShowWebCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ipakita ang $count Web plugin',
      one: 'Ipakita ang 1 Web plugin',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNoCategoryPlugins => 'Walang plugin sa kategoryang ito';

  @override
  String pluginsNoSearchResults(String query) {
    return 'Walang resulta para sa “$query”';
  }

  @override
  String pluginsFailureDetails(String title) {
    return '$title · I-tap para tingnan';
  }

  @override
  String get pluginsFeatured => 'Inirerekomenda';

  @override
  String pluginsInstalledRemoteRestart(String name, String host) {
    return 'Na-install ang “$name”. I-restart ang JDK sa $host para mailapat.';
  }

  @override
  String pluginsInstalledNamed(String name) {
    return 'Na-install ang “$name”';
  }

  @override
  String get pluginsInstallCancelled => 'Kinansela ang pag-install';

  @override
  String pluginsInstallFailureNamed(String name, String reason) {
    return '“$name” $reason';
  }

  @override
  String get pluginsRestartRequired => 'Kailangan ng pag-restart ng engine';

  @override
  String pluginsRestartExplanation(String name) {
    return 'I-restart ang engine para mailapat ang “$name”. Puputulin ang mga tumatakbong sagot.';
  }

  @override
  String get pluginsRestartEngine => 'I-restart ang engine';

  @override
  String get pluginsAllowBuildScripts => 'Payagan ang mga build script?';

  @override
  String get pluginsBuildScriptPackages => 'Nagpapatakbo ng mga script ang mga package na ito habang nag-i-install:';

  @override
  String pluginsBuildScriptWarning(String host) {
    return 'Tumatakbo ang mga script gamit ang mga pahintulot ng JDK sa $host at maaaring magbasa at magsulat ng mga file at mag-access sa internet. Payagan lang ito kung pinagkakatiwalaan mo ang plugin.';
  }

  @override
  String get pluginsThisDevice => 'Device na ito';

  @override
  String get pluginsAllowRetry => 'Payagan at subukang muli';

  @override
  String pluginsUpdateNamed(String name) {
    return 'I-update ang “$name”?';
  }

  @override
  String pluginsUninstallNamed(String title) {
    return 'I-uninstall ang “$title”?';
  }

  @override
  String pluginsUninstallExplanation(String host) {
    return 'Aalisin ang plugin sa $host. Mananatili ang data at mga setting nito.';
  }

  @override
  String get pluginsThisHost => 'Host na ito';

  @override
  String get pluginsUninstall => 'I-uninstall';

  @override
  String pluginsUninstalledNamed(String title) {
    return 'Na-uninstall ang “$title”';
  }

  @override
  String get pluginsRestartNow => 'I-restart ngayon';

  @override
  String get pluginsUninstallFailed => 'Hindi ma-uninstall';

  @override
  String get pluginsThatComputer => 'Computer na iyon';

  @override
  String get pluginsCommandAfterInstall =>
      'Pagkatapos mag-install, i-restart ang JDK sa computer na iyon, saka mag-refresh dito';

  @override
  String get pluginsError => 'Error';

  @override
  String get pluginsInventoryTitle => 'Imbentaryo ng plugin';

  @override
  String get pluginsGlobalPlugins => 'Mga global na plugin';

  @override
  String get pluginsAgentPresets => 'Mga agent preset';

  @override
  String get pluginsInventoryReadFailed => 'Hindi mabasa ang imbentaryo ng plugin';

  @override
  String pluginsComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count component', one: '1 component');
    return '$_temp0';
  }

  @override
  String pluginsEnabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count naka-enable', one: '1 naka-enable');
    return '$_temp0';
  }

  @override
  String pluginsErrorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count error', one: '1 error');
    return '$_temp0';
  }

  @override
  String get pluginsNoPlugins => 'Walang plugin';

  @override
  String get pluginsNoMatchingPlugins => 'Walang tumutugmang plugin';

  @override
  String get pluginsPresetLoadFailed => 'Hindi ma-load ang preset na ito';

  @override
  String get pluginsPresetNoPlugins => 'Walang plugin ang preset na ito';

  @override
  String get pluginsStandard => 'Standard';

  @override
  String get pluginsMinimal => 'Minimal';

  @override
  String pluginsDefaultPresetName(String name) {
    return '$name (default)';
  }

  @override
  String get pluginsSystemComponents => 'Mga component ng system';

  @override
  String pluginsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count item', one: '1 item');
    return '$_temp0';
  }

  @override
  String get pluginsSource => 'Source';

  @override
  String get pluginsDisableCondition => 'Naka-disable kapag';

  @override
  String get pluginsProvidedByPreset => 'Ibinigay ng preset';

  @override
  String get pluginsDetailsTitle => 'Mga detalye ng plugin';

  @override
  String pluginsPackageInfoError(String error) {
    return 'Di-wastong impormasyon ng package: $error';
  }

  @override
  String get pluginsInstalling => 'Ini-install';

  @override
  String get pluginsGet => 'Kunin';

  @override
  String get pluginsLoadingCannotCancel => 'Nilo-load ang plugin. Hindi makakansela ang hakbang na ito.';

  @override
  String get pluginsInstallDuration => 'Aabutin ng isa o dalawang minuto. Maaari mong iwanan ang pahinang ito.';

  @override
  String get pluginsViewInstallLogs => 'Tingnan ang mga log ng pag-install';

  @override
  String get pluginsViewDetails => 'Tingnan ang mga detalye';

  @override
  String get pluginsCopyCommand => 'Kopyahin ang command';

  @override
  String get pluginsCommandCopied => 'Nakopya ang command';

  @override
  String get pluginsMissingFiles => 'Nawawala ang mga file ng plugin. I-install muli para maayos.';

  @override
  String get pluginsNotDshPlugin => 'Hindi JDK plugin, hindi ma-load';

  @override
  String get pluginsIncompatible => 'Hindi tugma sa bersyong ito ng JDK, hindi na-load';

  @override
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion) {
    return 'Nangangailangan ng JDK $requiredVersion, kasalukuyan ay $currentVersion, hindi na-load';
  }

  @override
  String pluginsLoadFailure(String reason) {
    return 'Hindi ma-load: $reason';
  }

  @override
  String get pluginsUnknownReason => 'Hindi kilalang dahilan';

  @override
  String pluginsBundleProblem(String reason) {
    return 'Problema: $reason';
  }

  @override
  String pluginsRefreshFailure(String reason) {
    return 'Hindi ma-refresh: $reason';
  }

  @override
  String get pluginsTitle => 'Mga plugin';

  @override
  String get pluginsRefresh => 'I-refresh';

  @override
  String get pluginsMarketTitle => 'Plugin market';

  @override
  String get pluginsConnectToManage => 'Kumonekta sa engine para pamahalaan ang mga plugin';

  @override
  String get pluginsSafeModeOperationsBlocked => 'Hindi makapag-install o makapag-uninstall ng mga plugin sa Safe mode';

  @override
  String pluginsRelayToggleOnly(String host) {
    return '$host · Pag-on o pag-off lang ng mga plugin ang sinusuportahan ng Relay. Mag-install sa computer na iyon.';
  }

  @override
  String get pluginsInstallThisPhone => 'I-install sa: Telepono na ito';

  @override
  String pluginsInstallHost(String host) {
    return 'I-install sa: $host';
  }

  @override
  String get pluginsOfflineDescription =>
      'Lalabas ang mga naka-install na plugin kapag tumatakbo ang engine. Maaari ka nang mag-browse sa market.';

  @override
  String get pluginsIconChanged => 'Napili ang icon. Bumalik sa home screen para makita ang pagbabago.';

  @override
  String get pluginsIconChangeFailed => 'Hindi mapalitan ang icon. Subukang muli mamaya.';

  @override
  String get pluginsTheme => 'Tema';

  @override
  String get pluginsAppearance => 'Hitsura';

  @override
  String get pluginsColors => 'Mga kulay';

  @override
  String get pluginsFeatureIcons => 'Mga icon ng feature';

  @override
  String get pluginsAppIcon => 'Icon ng app';

  @override
  String get pluginsPet => 'Pet';

  @override
  String get pluginsCustomColor => 'Custom';

  @override
  String pluginsColorLabel(String label) {
    return 'Kulay: $label';
  }

  @override
  String get pluginsCoral => 'Coral';

  @override
  String get pluginsRouge => 'Rouge';

  @override
  String get pluginsOchre => 'Ochre';

  @override
  String get pluginsMoss => 'Moss';

  @override
  String get pluginsLake => 'Lake';

  @override
  String get pluginsIndigo => 'Indigo';

  @override
  String get pluginsHue => 'Hue';

  @override
  String get pluginsWallpaper => 'Wallpaper';

  @override
  String get pluginsFollowWallpaper => 'Gamitin ang mga kulay ng wallpaper';

  @override
  String get pluginsAllowHighPower => 'Payagan ang mataas na paggamit ng kuryente sa background';

  @override
  String pluginsVivoBatteryPath(String app) {
    return 'Battery › Background power consumption management › $app';
  }

  @override
  String get pluginsXiaomiBatterySetting => 'Battery saver: No restrictions';

  @override
  String pluginsXiaomiBatteryPath(String app) {
    return 'Manage apps › $app › Battery saver';
  }

  @override
  String get pluginsHuaweiBatterySetting => 'Payagan ang aktibidad sa background';

  @override
  String pluginsHuaweiBatteryPath(String app) {
    return 'Battery › App launch › $app';
  }

  @override
  String get pluginsOppoBatterySetting => 'Payagan ang aktibidad sa background';

  @override
  String pluginsOppoBatteryPath(String app) {
    return 'Battery › App battery management › $app';
  }

  @override
  String get pluginsSamsungBatterySetting => 'Battery: Unrestricted';

  @override
  String pluginsSamsungBatteryPath(String app) {
    return 'Apps › $app › Battery';
  }

  @override
  String get pluginsVivoBatteryStep => 'I-on ang “Allow high background power usage”';

  @override
  String pluginsXiaomiBatteryFullPath(String app) {
    return 'App settings › Manage apps › $app › Battery saver › No restrictions';
  }

  @override
  String get pluginsXiaomiAutostart => 'I-on ang “Autostart” sa parehong pahina';

  @override
  String get pluginsHuaweiBatteryStep => 'I-off ang “Manage automatically” at i-on ang “Allow background activity”';

  @override
  String get pluginsOppoBatteryStep => 'I-on ang “Allow background activity”';

  @override
  String get pluginsSamsungBatteryStep => 'Piliin ang “Unrestricted”';

  @override
  String get pluginsBackgroundTitle => 'Pagtakbo sa background';

  @override
  String get pluginsBackgroundDescription => 'Hayaang matapos ang mga chat sa background';

  @override
  String get pluginsSystem => 'System';

  @override
  String get pluginsSystemBatteryOptimization => 'Battery optimization ng system';

  @override
  String get pluginsTurnedOff => 'Naka-off';

  @override
  String get pluginsNotTurnedOff => 'Naka-on';

  @override
  String get pluginsStayOnline => 'Manatiling online';

  @override
  String get pluginsKeepEngineNotification => 'Panatilihin ang notification na “Engine running”';

  @override
  String pluginsLockInRecents(String app) {
    return 'I-lock ang $app sa mga kamakailang app';
  }

  @override
  String get pluginsPhoneBrands => 'Mga brand ng telepono';

  @override
  String get pluginsOtherBrands => 'Ibang mga brand';

  @override
  String pluginsConnectedHost(String host) {
    return 'Nakakonekta ($host)';
  }

  @override
  String pluginsConnectionError(String error) {
    return 'Hindi makakonekta: $error';
  }

  @override
  String get pluginsConnecting => 'Kumokonekta';

  @override
  String get pluginsDiagnosticsCopied => 'Nakopya ang diagnostics';

  @override
  String get pluginsDiagnostics => 'Diagnostics';

  @override
  String get pluginsDiagnosticsDescription => 'Isama sa mga bug report. Walang API key o token.';

  @override
  String get pluginsRuntime => 'Runtime';

  @override
  String get pluginsArchitecture => 'Arkitektura';

  @override
  String get pluginsBundledVersion => 'Kasamang bersyon';

  @override
  String get pluginsInstalledVersion => 'Naka-install na bersyon';

  @override
  String get pluginsErrorLabel => 'Error';

  @override
  String get pluginsConnection => 'Koneksyon';

  @override
  String get pluginsAddress => 'Address';

  @override
  String get pluginsClient => 'Client';

  @override
  String get pluginsConfigured => 'Nakatakda';

  @override
  String get pluginsExport => 'I-export';

  @override
  String get pluginsCopyDiagnostics => 'Kopyahin ang diagnostics';

  @override
  String get pluginsDiagnosticsContents => 'Mga bersyon at katayuan ng koneksyon lang';

  @override
  String get pluginsNotificationsPartlyBlocked => 'Ilan ay hinarang ng system';

  @override
  String get pluginsNotificationsBlocked => 'Hinarang ng system';

  @override
  String get pluginsTurnedOn => 'Naka-on';

  @override
  String get pluginsNotifications => 'Mga notification';

  @override
  String get pluginsNotificationSettingsFailed =>
      'Hindi mabuksan ang system settings. I-on ang mga notification sa Settings → Apps → JDK-Go → Notifications.';

  @override
  String get pluginsSystemNotificationsOff => 'Naka-off ang mga system notification';

  @override
  String get pluginsBackgroundNoAlerts => 'Hindi ka makakatanggap ng mga alerto habang nasa background ang app';

  @override
  String get pluginsApprovalNotificationsOff => 'Naka-off ang mga notification na “Kailangan ng pag-apruba”';

  @override
  String get pluginsBackgroundNoApprovalAlerts =>
      'Hindi ka makakatanggap ng mga alerto sa pag-apruba habang nasa background ang app';

  @override
  String get pluginsDoneNotificationsOff => 'Naka-off ang mga notification na “Natapos ang turn”';

  @override
  String get pluginsBackgroundNoDoneAlerts =>
      'Hindi ka makakatanggap ng mga alerto sa pagkumpleto o error habang nasa background ang app';

  @override
  String get pluginsTurnOn => 'I-on';

  @override
  String get pluginsNotificationsDescription => 'Makatanggap ng mga alerto kapag natapos ang mga chat o kailangan ka';

  @override
  String get pluginsAllowNotifications => 'Payagan ang mga notification';

  @override
  String get pluginsNotificationsAndBanners => 'Mga system notification at top banner';

  @override
  String get pluginsAlerts => 'Mga alerto';

  @override
  String get pluginsRemoteAlertsRequirement =>
      'Kailangang tumatakbo at nakakonekta ang app para sa mga alerto ng remote host';

  @override
  String get pluginsTurnComplete => 'Tapos na ang turn';

  @override
  String get pluginsReplyPreview => 'Isama ang simula ng sagot';

  @override
  String get pluginsErrorOrStopped => 'Error o huminto';

  @override
  String get pluginsErrorOrStoppedDescription => 'Nabigo ang request, nag-restart ang engine, o huminto';

  @override
  String get pluginsApprovalDescription =>
      'Kailangan ng pag-apruba para magpatakbo ng mga command, mag-edit ng mga file at iba pa';

  @override
  String get pluginsQuestions => 'Mga tanong para sa iyo';

  @override
  String get pluginsQuestionsDescription => 'Kailangan ng AI ang iyong sagot';

  @override
  String get pluginsSystemSettings => 'System settings';

  @override
  String get pluginsLockScreenPrivacy => 'Nananatiling nakatago ang nilalaman ng chat sa lock screen';

  @override
  String get pluginsSoundBannerLockScreen => 'Tunog, mga banner at lock screen';

  @override
  String get pluginsEnableFloatingNotifications =>
      'I-on ang “Floating notifications” kung hindi lumalabas ang mga banner';

  @override
  String get pluginsPersonalPreferences => 'Mga personal na kagustuhan';

  @override
  String get pluginsPreferencesDescription => 'Susundin ng mga bagong chat ang mga tagubiling ito';

  @override
  String get pluginsPreferencesHint => 'Halimbawa: Sumagot sa Tagalog. Pangunahing sumusulat ako ng Flutter.';

  @override
  String get pluginsSaving => 'Sine-save';

  @override
  String get pluginsShareLink => 'Ibahagi ang link';

  @override
  String get pluginsInstallPlugin => 'I-install ang plugin';

  @override
  String get pluginsImportProfile => 'I-import ang mga setting';

  @override
  String get pluginsImportTo => 'I-import sa';

  @override
  String get pluginsInstallTo => 'I-install sa';

  @override
  String get pluginsVerification => 'Verification';

  @override
  String get pluginsSize => 'Laki';

  @override
  String get pluginsVerified => 'Na-verify';

  @override
  String get pluginsVerificationMismatch => 'Hindi tugma ang verification';

  @override
  String get pluginsCannotVerify => 'Hindi ma-verify';

  @override
  String get pluginsVerifying => 'Bine-verify';

  @override
  String get pluginsPresets => 'Mga preset';

  @override
  String get pluginsSkills => 'Mga skill';

  @override
  String get pluginsAdded => 'Naidagdag';

  @override
  String get pluginsModified => 'Binago';

  @override
  String get pluginsNoChanges => 'Walang kailangang baguhin';

  @override
  String get pluginsUnavailable => 'Hindi available';

  @override
  String get pluginsHostProfileReadFailed => 'Hindi mabasa ang mga setting ng host na ito';

  @override
  String get pluginsAlreadyMatches => 'Tugma na ang host na ito';

  @override
  String get pluginsUnsuccessful => 'Nabigo';

  @override
  String get pluginsSkipped => 'Nilaktawan';

  @override
  String get pluginsView => 'Siyasatin';

  @override
  String get pluginsImport => 'I-import';

  @override
  String get pluginsHostPluginsReadFailed => 'Hindi mabasa ang mga plugin ng host na ito';

  @override
  String pluginsUpdateTo(String version) {
    return 'I-update sa $version';
  }

  @override
  String pluginsImportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'I-import ang $count item',
      one: 'I-import ang 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsImporting => 'Nag-iimport';

  @override
  String get pluginsInstallingActive => 'Ini-install';

  @override
  String pluginsImportFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item ang nabigo',
      one: '1 item ang nabigo',
    );
    return '$_temp0';
  }

  @override
  String get pluginsCouldNotInstall => 'Hindi ma-install';

  @override
  String get pluginsEngineRestartToApply => 'I-restart ang engine para mailapat';

  @override
  String pluginsRemoteRestartToApply(String host) {
    return 'I-restart ang JDK sa $host para mailapat';
  }

  @override
  String pluginsImportedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-import ang $count item',
      one: 'Na-import ang 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsLocalPluginUnshareable => 'Na-install nang lokal ang plugin na ito at hindi maibabahagi';

  @override
  String get pluginsSharePlugin => 'Ibahagi ang plugin';

  @override
  String pluginsPluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugin', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String pluginsSettingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count setting', one: '1 setting');
    return '$_temp0';
  }

  @override
  String pluginsPresetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count preset', one: '1 preset');
    return '$_temp0';
  }

  @override
  String pluginsSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count skill', one: '1 skill');
    return '$_temp0';
  }

  @override
  String get pluginsNothingSelected => 'Walang napili';

  @override
  String get pluginsNext => 'Susunod';

  @override
  String get pluginsNothingToShare => 'Walang maibabahagi';

  @override
  String get pluginsProfileReadFailed => 'Hindi mabasa ang mga setting';

  @override
  String get pluginsShareProfile => 'Ibahagi ang configuration';

  @override
  String pluginsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count file', one: '1 file');
    return '$_temp0';
  }

  @override
  String get pluginsShareNeedsUpdate => 'I-update ang app para mabuksan ito';

  @override
  String get pluginsShareUnusable => 'Hindi magagamit ang share code na ito';

  @override
  String get pluginsShareDamaged => 'Hindi kumpleto o sira ang share code na ito';

  @override
  String get pluginsShareFileReadFailed => 'Hindi mabasa ang file na ito';

  @override
  String get pluginsShareOpenFailed => 'Hindi mabuksan ang share code na ito';

  @override
  String get pluginsPluginShareTitle => 'Plugin ng JDK-Go';

  @override
  String get pluginsShareSheetOpenFailed => 'Hindi mabuksan ang pagbabahagi';

  @override
  String get pluginsSavePermissionDenied => 'Hindi ma-save nang walang pahintulot sa storage';

  @override
  String get pluginsQrCode => 'QR code';

  @override
  String get pluginsSaveAsFile => 'I-save bilang file';

  @override
  String get pluginsGistLinkReady => 'Nalikha ang Gist link';

  @override
  String get pluginsTooLargeShareFile => 'Masyadong marami ang nilalaman. Ibahagi bilang file.';

  @override
  String get pluginsGenerateLink => 'Lumikha ng link';

  @override
  String get pluginsGitHubToken => 'GitHub token';

  @override
  String get pluginsGistPermissionNeeded => 'Kailangan ng pahintulot sa Gist';

  @override
  String get pluginsGenerateGistLink => 'Lumikha ng Gist link';

  @override
  String get pluginsShareQrCode => 'QR code ng share code';

  @override
  String pluginsUpdateCurrentWarning(String to) {
    return 'Ia-uninstall ang kasalukuyang bersyon, saka ii-install ang $to. Kung mabigo ang pag-install, kakailanganing i-install muli ang plugin.';
  }

  @override
  String pluginsUpdateVersionWarning(String from, String to) {
    return 'Ia-uninstall ang $from, saka ii-install ang $to. Kung mabigo ang pag-install, kakailanganing i-install muli ang plugin.';
  }

  @override
  String pluginsUninstalledRestartLocal(String title) {
    return 'Na-uninstall ang “$title”. I-restart ang engine para matapos ang pag-alis.';
  }

  @override
  String pluginsUninstalledRestartRemote(String title, String host) {
    return 'Na-uninstall ang “$title”. I-restart ang JDK sa $host para matapos ang pag-alis.';
  }

  @override
  String get pluginsEnableFailed => 'Hindi ma-enable';

  @override
  String get pluginsDisableFailed => 'Hindi ma-disable';

  @override
  String get pluginsEnabledRestartLocal => 'Na-enable. I-restart ang engine para mailapat.';

  @override
  String pluginsEnabledRestartRemote(String host) {
    return 'Na-enable. I-restart ang JDK sa $host para mailapat.';
  }

  @override
  String get pluginsDisabledRestartLocal => 'Na-disable. I-restart ang engine para mailapat.';

  @override
  String pluginsDisabledRestartRemote(String host) {
    return 'Na-disable. I-restart ang JDK sa $host para mailapat.';
  }

  @override
  String pluginsRelayCommandInstruction(String host) {
    return 'Pag-on o pag-off lang ng mga plugin ang sinusuportahan ng JDK Remote. Patakbuhin ito sa terminal sa $host:';
  }

  @override
  String get pluginsPermissionLocalThirdParty =>
      'Tumatakbo ang mga plugin gamit ang mga pahintulot ng JDK: maaari silang magbasa at magsulat ng mga file, magpatakbo ng mga command, at magbasa ng mga API key at storage ng telepono na binigyan mo ng access. Hindi sila nililimitahan ng workspace sandbox. Ibinigay ng third party at hindi nasuri ng JDK.';

  @override
  String get pluginsPermissionLocalTrusted =>
      'Tumatakbo ang mga plugin gamit ang mga pahintulot ng JDK: maaari silang magbasa at magsulat ng mga file, magpatakbo ng mga command, at magbasa ng mga API key at storage ng telepono na binigyan mo ng access. Hindi sila nililimitahan ng workspace sandbox. Mag-install lang ng mga plugin na pinagkakatiwalaan mo.';

  @override
  String get pluginsPermissionRemoteThirdParty =>
      'Tumatakbo ang mga plugin gamit ang mga pahintulot ng JDK: maaari silang magbasa at magsulat ng mga file, magpatakbo ng mga command, at magbasa ng mga API key. Hindi sila nililimitahan ng workspace sandbox. Ibinigay ng third party at hindi nasuri ng JDK.';

  @override
  String get pluginsPermissionRemoteTrusted =>
      'Tumatakbo ang mga plugin gamit ang mga pahintulot ng JDK: maaari silang magbasa at magsulat ng mga file, magpatakbo ng mga command, at magbasa ng mga API key. Hindi sila nililimitahan ng workspace sandbox. Mag-install lang ng mga plugin na pinagkakatiwalaan mo.';

  @override
  String pluginsSelectedQrCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item ang napili',
      one: '1 item ang napili',
    );
    return '$_temp0 · Available ang QR code';
  }

  @override
  String pluginsSelectedFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item ang napili',
      one: '1 item ang napili',
    );
    return '$_temp0 · Ibahagi bilang file';
  }

  @override
  String get pluginsListSeparator => ',';

  @override
  String pluginsActionFailure(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String pluginsInventorySemantics(String title, String status) {
    return '$title, $status';
  }

  @override
  String pluginsSettingsChanges(String shown, int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count item', one: '1 item');
    return '$shown at iba pa · $_temp0';
  }

  @override
  String get pluginsLoadStatus => 'Katayuan ng pag-load';

  @override
  String get pluginsLoadPartial => 'Bahagyang aktibo';

  @override
  String get pluginsLoadFailed => 'Nabigo ang pag-load';

  @override
  String get pluginsLoadNotReady => 'Hindi pa handa';

  @override
  String get pluginsLoadMetadata => 'Diagnostics ng metadata';

  @override
  String pluginsLoadRunningCount(int running, int total) {
    return '$running sa $total component ang tumatakbo';
  }

  @override
  String get pluginsLoadUnreported => 'Hindi naiulat';

  @override
  String get pluginsLoadNoRuntimeDetail =>
      'Hindi nagbalik ang host ng mga detalye ng error sa runtime. Suriin ang mga log ng engine nito.';

  @override
  String get pluginsLoadRemoteLogs => 'Suriin ang mga log ng engine sa host na ito.';

  @override
  String get plugslotsSurfaceComposerTools => 'Mga tool ng plus panel';

  @override
  String get plugslotsSurfaceSessionActions => 'Mga aksyon ng chat';

  @override
  String get plugslotsSurfaceTurnNote => 'Mga tala ng turn';

  @override
  String get plugslotsSurfaceComposerActions => 'Mga button ng composer';

  @override
  String get plugslotsSurfaceMessageActions => 'Menu ng mensahe';

  @override
  String get plugslotsSurfaceComposerStrip => 'Status line';

  @override
  String get plugslotsSurfacePanel => 'Mga panel';

  @override
  String get plugslotsNativeUi => 'Native UI';

  @override
  String plugslotsIssueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count problema', one: '1 problema');
    return '$_temp0';
  }

  @override
  String get plugslotsAllGood => 'Walang problema';

  @override
  String plugslotsViewSize(String size) {
    return 'View $size';
  }

  @override
  String plugslotsInvokeMs(int ms) {
    return '$ms ms';
  }

  @override
  String get plugslotsLastView => 'Huling view';

  @override
  String get plugslotsLastInvoke => 'Huling tugon';

  @override
  String get plugslotsProblems => 'Mga problema';

  @override
  String get plugslotsNoProblems => 'Walang problema';

  @override
  String plugslotsWantsDraft(String plugin) {
    return 'Gustong basahin ng $plugin ang iyong draft';
  }

  @override
  String plugslotsWantsClipboard(String plugin) {
    return 'Gustong basahin ng $plugin ang iyong clipboard';
  }

  @override
  String plugslotsWantsBoth(String plugin) {
    return 'Gustong basahin ng $plugin ang iyong draft at clipboard';
  }

  @override
  String get plugslotsWantsWhen => 'Kapag tinap mo lang';

  @override
  String get plugslotsAllow => 'Payagan';

  @override
  String plugslotsNoResponse(String plugin) {
    return 'Hindi tumugon ang $plugin';
  }

  @override
  String plugslotsFailed(String plugin) {
    return 'Nagka-problema ang $plugin';
  }

  @override
  String get plugslotsNeedsChat => 'Magbukas muna ng chat';

  @override
  String plugslotsFromPlugin(String plugin) {
    return 'Mula sa $plugin';
  }

  @override
  String get plugslotsPanelOffline => 'Hindi maabot ang plugin';

  @override
  String plugslotsIssueTooMany(int max) {
    return 'Hanggang $max; nakatago ang iba';
  }

  @override
  String plugslotsIssueTrimmed(int max) {
    return 'Lampas $max karakter; pinaikli';
  }

  @override
  String plugslotsIssueNeedsApp(String version) {
    return 'Kailangan ng JDK-Go $version o mas bago';
  }

  @override
  String get plugslotsIssueNewerProtocol => 'Kailangan ng mas bagong app';

  @override
  String get plugslotsIssueUnknownIcon => 'Hindi kilalang icon; gumagamit ng default';

  @override
  String plugslotsIssueUnknownEffect(String name) {
    return 'Hindi sinusuportahang effect na \"$name\"';
  }

  @override
  String get plugslotsIssueLate => 'Bumalik nang higit sa 3 s pagkatapos ng tap; binalewala';

  @override
  String get plugslotsIssueHttps => 'Mga https link lang';

  @override
  String plugslotsIssueUnknownPage(String page) {
    return 'Walang pahinang tinatawag na \"$page\"';
  }

  @override
  String get plugslotsIssueThrottled => 'Masyadong madalas ang mga abiso; nilaktawan';

  @override
  String plugslotsIssueInvoke(String message) {
    return 'Nabigo ang tawag: $message';
  }

  @override
  String plugslotsIssueStream(String message) {
    return 'Nabigo ang data: $message';
  }

  @override
  String get plugslotsIssueMissing => 'Nawawala ang kinakailangang field';

  @override
  String get plugslotsIssueDuplicate => 'Duplicate na id; nilaktawan';

  @override
  String get plugslotsIssueNoPlacement => 'Walang mapagpapakitaan';

  @override
  String plugslotsWantsMessage(String plugin) {
    return 'Gustong basahin ng $plugin ang sagot na ito';
  }

  @override
  String get plugslotsCodeInvalidManifest => 'Di-wasto ang deklarasyon; naka-off ang mga native na bahagi';

  @override
  String get plugslotsCodeInvalidField => 'Maling format; nilaktawan';

  @override
  String get plugslotsCodeUnknownField => 'Hindi kilalang field; binalewala';

  @override
  String get plugslotsCodeUnknownSurface => 'Hindi pa sinusuportahan dito; binalewala';

  @override
  String get plugslotsCodeTooMany => 'Masyadong marami; nakatago ang labis';

  @override
  String get plugslotsCodeTooLong => 'Masyadong mahaba; pinaikli';

  @override
  String get plugslotsCodeNoHandler => 'Hindi pa naha-handle ng plugin; nakatago';

  @override
  String get plugslotsCodeUndeclared => 'Nakarehistro ngunit hindi idineklara; binalewala';

  @override
  String get plugslotsCodeViewFile => 'Hindi mabasa ang view file';

  @override
  String get plugslotsCodeBadEffect => 'Maling anyo ng aksyon; nilaktawan';

  @override
  String plugslotsCodeViolation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'nang $count beses',
      one: 'nang isang beses',
    );
    return 'Nabigo $_temp0';
  }

  @override
  String get plugslotsCodeDegraded => 'Masyadong maraming error; naka-off hanggang sa susunod na simula';

  @override
  String get plugslotsCodeTimeout => 'Hindi sumagot ang plugin sa tamang oras';

  @override
  String get plugslotsCodeRateLimited => 'Masyadong mabilis ang tap';

  @override
  String get plugslotsCodeNotFound => 'Naka-off o nawawala ang plugin';

  @override
  String get plugslotsCodePluginError => 'Nabigo ang plugin';

  @override
  String get plugslotsCodeInvalidView => 'Di-wasto ang view';

  @override
  String get plugslotsCodeLimit => 'Masyadong maraming subscription';

  @override
  String get plugslotsCodeOther => 'Ibang problema';

  @override
  String get plugslotsCodeUnknownEffect => 'Hindi sinusuportahang aksyon; nilaktawan';

  @override
  String get plugslotsNotDone => 'Hindi natapos';

  @override
  String get plugslotsWorking => 'Gumagana';

  @override
  String get plugslotsTapToCancel => 'I-tap para kanselahin';

  @override
  String get plugslotsCodeTooManyPending => 'Dalawa ang tumatakbo pa';

  @override
  String get plugslotsCodeNoStream => 'Naputol ang koneksyon';

  @override
  String plugslotsVoiceAsk(String plugin) {
    return 'Hayaang marinig ng $plugin ang iyong pagsasalita?';
  }

  @override
  String get plugslotsVoiceWhen =>
      'Humihinto ang pagbasa sa sandaling magsalita ka. Sinusuri ang iyong boses sa telepono na ito, hindi kailanman sine-save o ipinapadala';

  @override
  String get plugslotsVoiceDeny => 'Huwag payagan';

  @override
  String get plugslotsVoiceSwitch => 'Marinig ang iyong pagsasalita';

  @override
  String get plugslotsPickerUnavailable => 'Hindi available sa device na ito ang pagpili ng file';

  @override
  String get plugslotsPickerBusy => 'Tapusin muna ang kasalukuyang pagpili ng file';

  @override
  String plugslotsPickerLimit(int count) {
    return 'Hanggang $count file, 8 MiB bawat isa at 16 MiB sa kabuuan';
  }

  @override
  String get plugslotsPickerFailed => 'Hindi maibahagi ang mga file sa plugin na ito. Subukang muli';

  @override
  String get plugslotsWebPlacesTitle => 'Sa JDK Web';

  @override
  String get plugslotsPlaceBesideComposer => 'Sa tabi ng composer';

  @override
  String get plugslotsPlaceHeader => 'Header ng usapan';

  @override
  String get plugslotsPlaceMessages => 'Sa mga mensahe';

  @override
  String get plugslotsPlaceOverlay => 'Floating layer';

  @override
  String get plugslotsPlaceSidebar => 'Sidebar';

  @override
  String get plugslotsPlaceRightbar => 'Kanang sidebar';

  @override
  String get plugslotsPlaceFiles => 'Mga preview ng file';

  @override
  String get plugslotsPlaceSettings => 'Settings';

  @override
  String get plugslotsPlacePlugins => 'Pahina ng mga plugin';

  @override
  String get plugslotsPlaceNewChat => 'Bagong usapan';

  @override
  String get plugslotsPlaceElsewhere => 'Sa ibang lugar';

  @override
  String get plugslotsPlaceUnknown => 'Ang web interface nito';

  @override
  String get plugslotsChatEntry => 'Mga plugin';

  @override
  String plugslotsChatWebFrom(String names) {
    return 'Mga web plugin · $names';
  }

  @override
  String get plugViewInvalid => 'May error ang view ng plugin';

  @override
  String get plugViewEmpty => 'Wala pang data';

  @override
  String get plugViewImageUnavailable => 'Hindi maipakita ang larawan';

  @override
  String get plugViewUnavailableList => 'Hindi maipakita ang listahan';

  @override
  String get plugViewUnavailableKeyValue => 'Hindi maipakita ang mga detalye';

  @override
  String get plugViewUnavailableProgress => 'Hindi maipakita ang progreso';

  @override
  String get plugViewUnavailableTable => 'Hindi maipakita ang talahanayan';

  @override
  String get plugViewUnavailableActions => 'Hindi maipakita ang mga button';

  @override
  String plugViewFrom(String name) {
    return 'Mula sa $name';
  }

  @override
  String plugViewUnknownTone(String value) {
    return 'Hindi kilalang tone na $value, binalewala; mga available: good, warn, bad, info, muted';
  }

  @override
  String plugViewBadActionId(String value) {
    return 'Di-wastong action id na $value; hindi mata-tap ang elementong ito';
  }

  @override
  String plugViewBadAction(String shape) {
    return 'Ang isang action ay dapat na id string o $shape; binalewala';
  }

  @override
  String plugViewArgsLimit(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit byte', one: '1 byte');
    return 'Lumampas ang action args sa $_temp0; binalewala';
  }

  @override
  String plugViewUnknownIcon(String value) {
    return 'Hindi kilalang icon na $value; iginuhit gamit ang default na icon';
  }

  @override
  String plugViewExpectedItems(String shape) {
    return 'Inaasahan ang isang array ng $shape';
  }

  @override
  String plugViewSkippedItem(String shape) {
    return 'Inaasahan ang $shape; nilaktawan ang item';
  }

  @override
  String get plugViewBadMax => 'Dapat numerong higit sa 0 ang max; gumagamit ng 100';

  @override
  String plugViewColumnLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first column', one: '1 column');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String plugViewFirstColumns(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit column', one: '1 column');
    return 'Ipinapakita lang ang unang $_temp0';
  }

  @override
  String plugViewFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit hilera', one: '1 hilera');
    return 'Ipinapakita lang ang unang $_temp0';
  }

  @override
  String get plugViewOnePrimary =>
      'Isang primary button lang ang maaari sa isang view; ang isang ito ay iginuhit bilang plain';

  @override
  String get plugViewBadImageSource =>
      'Ang mga larawan ay nangangailangan ng asset ng plugin (asset:<path>, png, jpg, webp o gif) o data:image/… URL';

  @override
  String get plugViewBadAspect => 'Dapat numerong mula 0.25 hanggang 4 ang aspect; binalewala';

  @override
  String plugViewImageTooLarge(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit byte', one: '1 byte');
    return 'Lumampas ang data: na larawan sa $_temp0';
  }

  @override
  String get plugViewImageDecode => 'Hindi ma-decode ang larawan (PNG, JPEG, WebP o GIF lang)';

  @override
  String get plugViewImagePixels =>
      'Lumampas ang larawan sa limitasyon ng laki: 4096 bawat gilid, 4 milyong pixel sa kabuuan';

  @override
  String plugViewTooDeep(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit antas', one: '1 antas');
    return 'Mas malalim ang pagkaka-nest ng JSON kaysa sa $_temp0';
  }

  @override
  String get plugViewV2Content => 'Nilalaman ng plugin';

  @override
  String plugViewVersionFallback(String version) {
    return 'Hindi sinusuportahan ang bersyon ng view na $version; gumagamit ng katugmang view';
  }

  @override
  String plugViewStyleInvalid(String values) {
    return 'Di-wastong style; inaasahan ang $values';
  }

  @override
  String get plugViewStyleReserved => 'Nakalaan sa app ang hitsurang ito; binalewala';

  @override
  String get plugViewStyleContainerOnly => 'Sa stack at row lang available ang style na ito';

  @override
  String get plugViewStyleTextOnly => 'Sa text, metric at callout lang available ang style na ito';

  @override
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum) {
    return '$mode: inayos ang $before sa $after, contrast na hindi bababa sa $minimum:1';
  }

  @override
  String get plugViewRichLimit => 'Lumampas ang rich text sa limitasyon; pinutol';

  @override
  String plugViewBadTrend(int max) {
    return 'Ang trend ay tumatanggap ng 2–$max numero (pinapayagan ang null); binalewala';
  }

  @override
  String plugViewGalleryPicture(int index) {
    return 'Larawan $index';
  }

  @override
  String get readListUpdating => 'Ina-update · mga naunang resulta';

  @override
  String get readListOffline => 'Offline · mga naunang resulta';

  @override
  String get readListFailed => 'Hindi na-update · mga naunang resulta';

  @override
  String get remoteStartupSection => 'Sa paglunsad';

  @override
  String get remoteAutoConnectOnStartup => 'Kumonekta sa huling host';

  @override
  String get remoteAutoConnectOnStartupHint => 'Kapag naka-off, magsimula sa telepono na ito';

  @override
  String get remoteStepConnect => 'Kumonekta sa server';

  @override
  String get remoteStepVerifyHostKey => 'I-verify ang fingerprint ng host';

  @override
  String get remoteStepStartDsh => 'Simulan ang JDK';

  @override
  String get remoteStepTunnel => 'Lumikha ng tunnel';

  @override
  String get remoteConnecting => 'Kumokonekta';

  @override
  String get remoteConnected => 'Nakakonekta';

  @override
  String get remoteReconnecting => 'Muling kumokonekta';

  @override
  String remoteReconnectAttempt(int count) {
    return 'Muling kumokonekta · Pagtatangka $count';
  }

  @override
  String get remoteErrInvalidServer => 'Di-wastong address ng server';

  @override
  String get remoteErrEmailPassword => 'Maling email o password';

  @override
  String get remoteErrHostNotInAccount => 'Wala sa iyong account ang host na ito';

  @override
  String get remoteHostFallback => 'Host na ito';

  @override
  String get remoteErrHostOffline => 'Offline ang host';

  @override
  String remoteErrHostRemoved(String name) {
    return 'Wala na si $name sa iyong JDK Remote account';
  }

  @override
  String get remoteErrRelaySignInExpired => 'Nag-expire ang JDK Remote sign-in';

  @override
  String get remoteErrIdentityKeyChanged => 'Nagbago ang identity key ng host';

  @override
  String get remoteErrIdentityUnconfirmed => 'Hindi pa nakumpirma ang identity fingerprint ng host';

  @override
  String get remoteErrConnectionReplaced => 'Napalitan ang remote na koneksyon';

  @override
  String get remoteErrHostRejected => 'Tinanggihan ng host ang koneksyon';

  @override
  String get remoteErrHostNotOwned => 'Wala sa iyong JDK Remote account ang host';

  @override
  String get remoteErrUpdateNeeded => 'Hindi tugma ang bersyon. I-update ang JDK-Go at ang remote plugin ng host';

  @override
  String get remoteErrVersionIncompatible => 'I-update ang JDK o ang remote plugin sa host';

  @override
  String get remoteErrSignInTimeout => 'Nag-time out ang pag-sign in';

  @override
  String get remoteSignInCancelled => 'Kinansela ang pag-sign in';

  @override
  String get remoteErrBrowserSignInUnsupported => 'Hindi sinusuportahan ng server ang browser sign-in';

  @override
  String get remoteErrTooManyRequests => 'Masyadong maraming request';

  @override
  String get remoteErrHostUnreachable => 'Hindi maabot ang remote host';

  @override
  String get remoteErrRemoteConnection => 'Hindi makakonekta nang remote';

  @override
  String get remoteOnline => 'Online';

  @override
  String get remoteOffline => 'Offline';

  @override
  String get remoteUnavailable => 'Hindi available';

  @override
  String get remoteErrHostNotFound => 'Hindi nahanap ang host';

  @override
  String get remoteConnectionStopped => 'Huminto ang remote na koneksyon';

  @override
  String remoteBootstrapReusePort(int port) {
    return 'Gumagamit ng tumatakbong DSH (port $port)';
  }

  @override
  String get remoteBootstrapStarting => 'Sinisimulan ang remote JDK…';

  @override
  String remoteErrCommandNotFound(String command) {
    return 'Hindi nahanap ang “$command” sa host';
  }

  @override
  String get remoteErrDshMissing =>
      'Hindi naka-install ang dsh sa host. I-install ito at subukang muli, o ilagay ang buong path nito bilang start command.';

  @override
  String get remoteStartCommandExample => 'Halimbawang start command: ~/.nvm/versions/node/v22.0.0/bin/dsh web';

  @override
  String get remoteErrDshStartTimeout => 'Masyadong natagalan ang remote JDK bago magsimula';

  @override
  String get remoteErrDshExited => 'Lumabas ang remote JDK agad pagkatapos magsimula';

  @override
  String get remoteErrDshStart => 'Hindi masimulan ang remote JDK';

  @override
  String remoteExitCode(int code) {
    return 'Exit code $code';
  }

  @override
  String get remoteErrNoShell => 'Walang sh ang host. Linux at macOS lang ang sinusuportahan.';

  @override
  String get remoteErrFingerprintChanged => 'Nagbago ang fingerprint ng host. Na-disconnect.';

  @override
  String get remoteErrFingerprintUnconfirmed => 'Hindi pa nakumpirma ang fingerprint ng host';

  @override
  String get remoteHostTrustCancelled => 'Kinansela ang tiwala sa host';

  @override
  String get remoteCheckingDsh => 'Sinusuri ang remote JDK…';

  @override
  String get remoteErrDshPort => 'Hindi maabot ang port ng remote JDK';

  @override
  String get remoteDshReused => 'Gumagamit ng JDK na tumatakbo na sa host';

  @override
  String get remoteDshStarted => 'Sinimulan ang JDK sa host';

  @override
  String get remoteErrDshTokenRejected => 'Tinanggihan ng remote JDK ang sign-in token';

  @override
  String get remoteErrDshSignIn => 'Hindi makapag-sign in sa remote JDK';

  @override
  String get remoteErrDshTunnel => 'Hindi makakonekta sa JDK sa pamamagitan ng tunnel';

  @override
  String get remoteErrDshSignInExpired => 'Nag-expire ang sign-in ng remote JDK';

  @override
  String get remoteErrDshStopped => 'Huminto sa pagtakbo ang remote JDK';

  @override
  String get remoteErrSshDisconnected => 'Na-disconnect ang SSH';

  @override
  String get remoteErrSshUnresponsive => 'Hindi tumutugon ang SSH';

  @override
  String remoteRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sinubukang muli nang $count beses',
      one: 'Sinubukang muli nang isang beses',
    );
    return '$_temp0';
  }

  @override
  String get remoteErrSshNetworkChanged => 'Na-disconnect ang SSH pagkatapos ng pagbabago ng network';

  @override
  String get remoteErrReadFingerprint => 'Hindi mabasa ang fingerprint ng host';

  @override
  String get remoteErrNoFingerprint => 'Hindi nagbigay ng fingerprint ng host ang server';

  @override
  String get remoteErrPasswordMissing => 'Maglagay ng password';

  @override
  String remoteErrAddressUnresponsive(String host, int port) {
    return 'Hindi tumutugon ang $host:$port';
  }

  @override
  String get remoteErrPrivateKeyMissing => 'Maglagay ng private key';

  @override
  String get remoteErrKeyNeedsPassword => 'Nangangailangan ng passphrase ang private key na ito';

  @override
  String get remoteErrKeyPassword => 'Maling passphrase ng private key';

  @override
  String get remoteErrKeyUnreadable => 'Hindi mabasa ang private key';

  @override
  String remotePrivateKeyFormats(String error) {
    return 'Sinusuportahan ang mga private key na Ed25519, RSA at ECDSA sa mga format na OpenSSH at PEM.\n$error';
  }

  @override
  String remoteErrAddressRejected(String address) {
    return 'Tinanggihan ng $address ang koneksyon';
  }

  @override
  String remoteErrSshHostNotFound(String host) {
    return 'Hindi nahanap ang host na $host';
  }

  @override
  String remoteErrSshAddressUnresponsive(String address) {
    return 'Hindi tumutugon ang $address';
  }

  @override
  String get remoteErrUsernamePassword => 'Maling username o password';

  @override
  String get remoteErrPrivateKeyRejected => 'Hindi tinatanggap ng server ang private key na ito';

  @override
  String remoteAuthorizedKeysHelp(String username, String error) {
    return 'Tiyaking nasa ~/.ssh/authorized_keys ni $username ang public key.\n$error';
  }

  @override
  String get remoteErrFingerprintUntrusted => 'Hindi pinagkakatiwalaan ang fingerprint ng host';

  @override
  String get remoteErrSshHandshakeTimeout => 'Nag-time out ang SSH handshake';

  @override
  String get remoteErrSshInterrupted => 'Naputol ang koneksyon ng SSH';

  @override
  String get remoteErrSshConnection => 'Hindi makakonekta sa pamamagitan ng SSH';

  @override
  String get remoteErrCommandTimeout => 'Nag-time out ang remote command';

  @override
  String get remoteHostedErrNetwork =>
      'Hindi maabot ang serbisyo ng pagbabahagi. Suriin ang iyong koneksyon at subukang muli.';

  @override
  String get remoteHostedErrTooLarge => 'Masyadong malaki ang chat para makalikha ng link';

  @override
  String get remoteHostedErrRateLimited => 'Masyadong madalas magbahagi. Subukang muli mamaya.';

  @override
  String get remoteHostedErrCreate => 'Hindi malikha ang link';

  @override
  String get remoteHostedErrUnavailable => 'Hindi available ang serbisyo ng pagbabahagi. Subukang muli mamaya.';

  @override
  String get remoteHostedErrGone => 'Nag-expire o nabura ang link';

  @override
  String get remoteHostedErrForbidden => 'Wala kang pahintulot na burahin ang link na ito';

  @override
  String get remoteHostedErrBroken => 'Hindi kumpleto o sira ang link';

  @override
  String get remoteChat => 'Chat';

  @override
  String get remoteHostedTtlWeek => '7 araw';

  @override
  String get remoteHostedTtlMonth => '30 araw';

  @override
  String get remoteHostedTtlForever => 'Magpakailanman';

  @override
  String get remoteForumSignIn => 'Mag-sign in sa Forum';

  @override
  String get remoteForumSignInBenefits => 'Mag-post, sumagot at mag-like';

  @override
  String get remoteForumFinishSignIn => 'Tapusin ang pag-sign in sa iyong browser';

  @override
  String get remoteReopenBrowser => 'Buksan muli ang browser';

  @override
  String get remoteForumSettings => 'Mga setting ng Forum';

  @override
  String get remoteForumAccount => 'Forum account';

  @override
  String get remoteForumTopic => 'Paksa';

  @override
  String get remoteForumLikesReceived => 'Mga natanggap na like';

  @override
  String get remoteForumDaysVisited => 'Mga araw na bumisita';

  @override
  String get remoteForumNotifications => 'Mga notification';

  @override
  String remoteForumUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hindi pa nababasa',
      one: '1 hindi pa nababasa',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumErrAddress => 'Di-wastong address';

  @override
  String get remoteForumAddress => 'Address ng Forum';

  @override
  String remoteForumDefaultAddress(String host) {
    return 'Default: $host';
  }

  @override
  String get remoteRestoreDefault => 'Ibalik ang default';

  @override
  String get remoteForumUploadingImage => 'Ina-upload ang larawan…';

  @override
  String get remoteForumErrUploadImage => 'Hindi ma-upload ang larawan';

  @override
  String get remoteForumTitleRequired => 'Magdagdag muna ng pamagat';

  @override
  String get remoteForumCategoryRequired => 'Pumili ng kategorya';

  @override
  String get remoteForumBodyRequired => 'Sumulat muna ng kahit ano bago magpadala';

  @override
  String remoteForumReplyCaption(String username, String title) {
    return 'Sumagot kay @$username · $title';
  }

  @override
  String get remoteForumNewTopic => 'Bagong paksa';

  @override
  String get remoteForumTitle => 'Pamagat';

  @override
  String get remoteForumComposerHint => 'Sumulat ng kahit ano. Sinusuportahan ang Markdown.';

  @override
  String get remoteForumPublish => 'I-publish';

  @override
  String get remoteForumImage => 'Larawan';

  @override
  String get remoteForumAttachShareCode => 'I-attach ang share code';

  @override
  String get remoteForumPendingApproval => 'Naisumite. Makikita pagkatapos ng pag-apruba.';

  @override
  String get remoteForumLatest => 'Pinakabago';

  @override
  String get remoteForumTop => 'Nangunguna';

  @override
  String get remoteForumErrOpen => 'Hindi mabuksan ang Forum';

  @override
  String get remoteForumNoTopics => 'Wala pang paksa';

  @override
  String get remoteForumPost => 'Post';

  @override
  String get remoteForum => 'Forum';

  @override
  String remoteForumNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mga notification, $count hindi pa nababasa',
      one: 'Mga notification, 1 hindi pa nababasa',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumSearch => 'Maghanap';

  @override
  String get remoteForumSearchHint => 'Maghanap ng mga paksa at post';

  @override
  String get remoteForumSignedIn => 'Naka-sign in sa Forum';

  @override
  String get remoteForumSignInForNotifications => 'Mag-sign in para makita ang mga notification';

  @override
  String get remoteForumErrNotifications => 'Hindi ma-load ang mga notification';

  @override
  String get remoteForumNoNotifications => 'Wala pang notification';

  @override
  String get remoteForumMarkAllRead => 'Markahang nabasa na lahat';

  @override
  String get remoteForumSomeone => 'May isang tao';

  @override
  String remoteForumNotificationMention(String who) {
    return 'Binanggit ka ni $who';
  }

  @override
  String remoteForumNotificationGroupMention(String who) {
    return 'Binanggit ni $who ang iyong grupo';
  }

  @override
  String remoteForumNotificationReply(String who) {
    return 'Sinagot ka ni $who';
  }

  @override
  String remoteForumNotificationQuote(String who) {
    return 'Sinipi ka ni $who';
  }

  @override
  String remoteForumNotificationEdit(String who) {
    return 'In-edit ni $who ang iyong post';
  }

  @override
  String remoteForumNotificationLikes(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nag-like sa iyong post si $who at iba pa ($count tao)',
      one: 'Nag-like si $who sa iyong post',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationLike(String who) {
    return 'Nag-like si $who sa iyong post';
  }

  @override
  String remoteForumNotificationLikedPosts(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nag-like si $who sa $count sa iyong mga post',
      one: 'Nag-like si $who sa 1 sa iyong mga post',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationReaction(String who) {
    return 'Nag-react si $who sa iyong post';
  }

  @override
  String remoteForumNotificationMessage(String who) {
    return 'Nagpadala sa iyo si $who ng pribadong mensahe';
  }

  @override
  String remoteForumNotificationMessageInvite(String who) {
    return 'Inimbitahan ka ni $who sa pribadong mensahe';
  }

  @override
  String remoteForumNotificationTopicInvite(String who) {
    return 'Inimbitahan ka ni $who sa isang paksa';
  }

  @override
  String remoteForumNotificationNewReply(String who) {
    return 'Nag-post si $who ng bagong sagot';
  }

  @override
  String remoteForumNotificationNewTopic(String who) {
    return 'Nag-post si $who ng bagong paksa';
  }

  @override
  String remoteForumNotificationLink(String who) {
    return 'Nag-link si $who sa iyong post';
  }

  @override
  String remoteForumNotificationBadge(String badge) {
    return 'Nakuha ang badge na “$badge”';
  }

  @override
  String remoteForumNotificationMoved(String who) {
    return 'Inilipat ni $who ang iyong post';
  }

  @override
  String get remoteForumBookmarkReminder => 'Paalala sa bookmark';

  @override
  String get remoteForumTopicReminder => 'Paalala sa paksa';

  @override
  String get remoteForumPostApproved => 'Naaprubahan ang iyong post';

  @override
  String get remoteForumAdminProblems => 'May mga isyung dapat lutasin ang Forum';

  @override
  String get remoteForumNewNotification => 'Bagong notification';

  @override
  String get remoteForumUnread => 'Hindi pa nababasa';

  @override
  String get remoteForumErrShareCode => 'Hindi mabuksan ang share code';

  @override
  String get remoteForumPoll => 'Poll';

  @override
  String get remoteForumVideo => 'Video';

  @override
  String get remoteForumEmbed => 'Naka-embed na nilalaman';

  @override
  String get remoteForumVoteOnWeb => 'Bumoto sa Web';

  @override
  String get remoteForumErrSearch => 'Hindi makapaghanap';

  @override
  String remoteForumNoSearchResults(String term) {
    return 'Walang resulta para sa “$term”';
  }

  @override
  String get remoteForumBookmarkRemoved => 'Inalis ang bookmark';

  @override
  String get remoteForumBookmarkAdded => 'Na-bookmark';

  @override
  String get remoteLinkCopied => 'Nakopya ang link';

  @override
  String get remoteForumErrTopic => 'Hindi mabuksan ang paksang ito';

  @override
  String get remoteForumTopicClosed => 'Sarado ang paksa';

  @override
  String get remoteForumReplyHint => 'Sumulat ng sagot…';

  @override
  String get remoteForumSignInToReply => 'Mag-sign in para sumagot';

  @override
  String remoteForumReplyTo(String username) {
    return 'Sumagot kay @$username';
  }

  @override
  String get remoteForumPostDeleted => 'Nabura ang post';

  @override
  String get remoteForumPostHidden => 'Nakatago ang post';

  @override
  String get remoteForumUnlike => 'I-unlike';

  @override
  String get remoteForumLike => 'I-like';

  @override
  String get remoteForumRemoveBookmark => 'Alisin ang bookmark';

  @override
  String get remoteForumBookmark => 'I-bookmark';

  @override
  String get remoteForumActionPinned => 'Na-pin ang paksa';

  @override
  String get remoteForumActionUnpinned => 'Na-unpin ang paksa';

  @override
  String get remoteForumActionClosed => 'Isinara ang paksa';

  @override
  String get remoteForumActionReopened => 'Muling binuksan ang paksa';

  @override
  String get remoteForumActionAutoClosed => 'Awtomatikong isinara ang paksa';

  @override
  String get remoteForumActionAutoOpened => 'Awtomatikong binuksan ang paksa';

  @override
  String get remoteForumActionArchived => 'Na-archive ang paksa';

  @override
  String get remoteForumActionUnarchived => 'Na-unarchive ang paksa';

  @override
  String get remoteForumActionListed => 'Ginawang pampubliko ang paksa';

  @override
  String get remoteForumActionUnlisted => 'Inalis sa listahan ang paksa';

  @override
  String get remoteForumActionSplit => 'Hinati ang paksa';

  @override
  String get remoteForumActionBanner => 'Ginawang banner ang paksa';

  @override
  String get remoteForumActionRemoveBanner => 'Inalis ang banner';

  @override
  String get remoteForumActionUpdated => 'Na-update ang paksa';

  @override
  String get remoteLoading => 'Nilo-load';

  @override
  String get remoteForumJustNow => 'Ngayon lang';

  @override
  String remoteForumMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min ang nakalipas',
      one: '1 min ang nakalipas',
    );
    return '$_temp0';
  }

  @override
  String remoteForumHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oras ang nakalipas',
      one: '1 oras ang nakalipas',
    );
    return '$_temp0';
  }

  @override
  String remoteForumDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araw ang nakalipas',
      one: '1 araw ang nakalipas',
    );
    return '$_temp0';
  }

  @override
  String remoteForumReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count sagot', one: '1 sagot');
    return '$_temp0';
  }

  @override
  String remoteForumNewReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bagong sagot',
      one: '1 bagong sagot',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumNew => 'Bago';

  @override
  String remoteForumErrorRetry(String error) {
    return '$error · Subukang muli';
  }

  @override
  String get remoteForumNoMore => 'Wala na';

  @override
  String get remoteHostKeyTrustTitle => 'Pagkatiwalaan ang host na ito?';

  @override
  String remoteHostKeyFirstConnection(String name, String address) {
    return 'Unang koneksyon sa “$name” ($address). Suriin ang fingerprint para makumpirmang ito ang iyong host.';
  }

  @override
  String get remoteHostKeyTrustConnect => 'Pagkatiwalaan at kumonekta';

  @override
  String get remoteHostKeyChangedTitle => 'Nagbago ang identity fingerprint';

  @override
  String remoteRelayKeyChangedBody(String name) {
    return 'Nagbago ang identity key ng “$name”. Magpatuloy lang kung muli mong na-install ang remote plugin sa host na ito. Maaaring may nagpapanggap dito.';
  }

  @override
  String remoteRelayKeyFirstBody(String name) {
    return 'Unang koneksyon sa “$name”. Tiyaking tugma ang identity fingerprint sa ipinapakita ng remote plugin ng host bago magpatuloy.';
  }

  @override
  String get remoteHostKeyChangeWarning => 'Tatanggi ang JDK na kumonekta kung magbago ang fingerprint.';

  @override
  String get remoteHostKeyTrustAgain => 'Pagkatiwalaan muli';

  @override
  String get remoteHostKeyReading => 'Binabasa ang fingerprint ng host…';

  @override
  String remoteHostSwitcherSemantics(String name, String status) {
    return 'Kasalukuyang host: $name, $status. Lumipat ng host';
  }

  @override
  String get remoteSwitchHost => 'Lumipat ng host';

  @override
  String get remoteThisPhoneDsh => 'JDK sa telepono na ito';

  @override
  String get remoteRemoteLabel => 'Remote';

  @override
  String remoteRemotePlatform(String platform) {
    return 'Remote · $platform';
  }

  @override
  String get remoteRelaySwitchWarning =>
      'Isang host lang ang kinokonektahan ng JDK Remote sa bawat pagkakataon. Madi-disconnect ang nakaraang host kapag lumipat.';

  @override
  String get remoteConnectComputer => 'Ikonekta ang isang computer o server';

  @override
  String get remoteManageHosts => 'Pamahalaan ang mga remote host';

  @override
  String get remoteConnectionMethods => 'Sa pamamagitan ng SSH o JDK Remote';

  @override
  String get remoteRelayLoginRequired => 'Ilagay ang address ng server, email at password';

  @override
  String get remoteErrSignIn => 'Hindi makapag-sign in';

  @override
  String get remoteSelfHostedServer => 'Self-hosted na server';

  @override
  String get remoteSelfHostedSignInHelp =>
      'Mag-sign in sa sarili mong liguobao/ds-harness-remote gamit ang email at password';

  @override
  String get remoteServerAddress => 'Address ng server';

  @override
  String get remoteEmail => 'Email';

  @override
  String get remotePassword => 'Password';

  @override
  String get remoteRestoreServer => 'Ibalik ang default na server na dsh.r2049.cn';

  @override
  String get remoteConsole => 'Remote console';

  @override
  String get remoteHostsIntro => 'Patuloy na gamitin ang JDK mula sa iyong computer o server sa telepono mo';

  @override
  String get remoteSshHosts => 'Mga SSH host';

  @override
  String get remoteSshRequirements => 'Kailangang naka-enable ang SSH sa host at naka-install ang JDK';

  @override
  String get remoteAddSshHost => 'Magdagdag ng SSH host';

  @override
  String get remoteSshDirect => 'Walang third-party na server';

  @override
  String get remoteOtherMethods => 'Ibang mga paraan';

  @override
  String get remoteWebConsole => 'Web remote console';

  @override
  String get remoteWebConsoleProvider => 'dsh.r2049.cn · Third-party na pahina';

  @override
  String remoteActiveHost(String name) {
    return 'Gumagamit ng “$name”';
  }

  @override
  String get remoteSwitchToPhone => 'Gamitin ang telepono na ito';

  @override
  String get remoteSignInAgain => 'Mag-sign in muli';

  @override
  String get remoteHostSettings => 'Mga setting ng host';

  @override
  String get remoteReconnect => 'Kumonekta muli';

  @override
  String get remoteReconnectingEllipsis => 'Muling kumokonekta…';

  @override
  String remoteReconnectReason(String reason) {
    return 'Muling kumokonekta · $reason';
  }

  @override
  String get remoteConnectedEncrypted => 'Nakakonekta · End-to-end encrypted';

  @override
  String remoteConnectedVia(String path) {
    return 'Nakakonekta · $path · End-to-end encrypted';
  }

  @override
  String get remotePathDirect => 'Direkta';

  @override
  String get remotePathTurn => 'TURN';

  @override
  String get remotePathRelay => 'Relay';

  @override
  String remoteConnectedSsh(String address) {
    return 'Nakakonekta · SSH $address';
  }

  @override
  String get remoteErrRefreshHosts => 'Hindi ma-refresh ang listahan ng host';

  @override
  String get remoteSwitchWarning =>
      'Kumokonekta sa isang host sa bawat pagkakataon. Madi-disconnect ang nakaraang host kapag lumipat.';

  @override
  String get remoteRefreshHosts => 'I-refresh ang mga host';

  @override
  String get remoteSignOut => 'Mag-sign out';

  @override
  String get remoteErrHostsRetry => 'Hindi ma-load ang mga host · I-tap para subukang muli';

  @override
  String get remoteNoHosts => 'Wala pang host';

  @override
  String get remoteRelaySetupHelp => 'I-install ang remote plugin sa JDK ng host at mag-sign in';

  @override
  String get remoteRelaySignOutTitle => 'Mag-sign out sa JDK Remote?';

  @override
  String get remoteRelaySignOutBody =>
      'Aalisin ang telepono na ito sa iyong account. Mananatili ang JDK at mga chat sa host. Maaari kang mag-sign in muli anumang oras.';

  @override
  String get remoteRelaySignInTitle => 'Mag-sign in sa JDK Remote';

  @override
  String get remoteRelaySignInHelp => 'Walang setup ng network. End-to-end encrypted na koneksyon.';

  @override
  String get remoteBrowserSignIn => 'Mag-sign in sa browser';

  @override
  String remoteSignInWithProvider(String provider) {
    return 'Magpatuloy gamit ang $provider';
  }

  @override
  String get remoteComingSoon => 'Malapit na';

  @override
  String get remoteSelfHostedEmailSignIn => 'Self-hosted na server · Email sign-in';

  @override
  String get remoteBrowserSignInPending => 'Tapusin ang pag-sign in sa iyong browser…';

  @override
  String get remoteCopySignInLink => 'Kopyahin ang sign-in link';

  @override
  String get remoteSshAddressRequired => 'Maglagay ng address ng host (IP o domain)';

  @override
  String get remoteSshUsernameRequired => 'Maglagay ng username';

  @override
  String get remoteSshPasswordRequired => 'Maglagay ng SSH password, o gumamit ng private key';

  @override
  String get remoteSshKeyRequired => 'I-paste ang buong private key (nagsisimula sa -----BEGIN)';

  @override
  String get remoteHostKeyResetTitle => 'I-reset ang fingerprint ng host?';

  @override
  String get remoteHostKeyResetBody =>
      'Gawin lang ito kung na-reinstall o napalitan ang host. Hihilingin sa iyong suriin ang fingerprint sa susunod na koneksyon.';

  @override
  String get remoteReset => 'I-reset';

  @override
  String remoteDeleteHostTitle(String name) {
    return 'Burahin ang “$name”?';
  }

  @override
  String get remoteDeleteHostBody =>
      'Mabubura ang mga setting ng host na ito at ang password at private key na naka-save sa telepono na ito. Mananatili ang JDK at mga chat sa host.';

  @override
  String remoteErrReadKey(String error) {
    return 'Hindi mabasa: $error';
  }

  @override
  String get remoteErrPublicKeyFile => 'Hindi ito private key. Piliin ang file na walang .pub (tulad ng id_ed25519).';

  @override
  String get remotePrivateKeyImported => 'Na-import ang private key. Maaari mong burahin ang orihinal na file.';

  @override
  String get remoteEditHost => 'I-edit ang host';

  @override
  String get remoteSshHostIntro => 'Kumonekta sa JDK sa iyong computer o server';

  @override
  String get remoteHostBasicInfo => 'Pangunahing impormasyon';

  @override
  String get remoteHostNameHint => 'Halimbawa: computer, Mac sa bahay';

  @override
  String get remoteHost => 'Host';

  @override
  String get remoteHostAddressHint => '192.168.1.20 o example.com';

  @override
  String get remoteUsername => 'Username';

  @override
  String get remotePort => 'Port';

  @override
  String get remoteAuthentication => 'Paraan ng pag-sign in';

  @override
  String get remotePasswordStorageHelp => 'Naka-save lang sa telepono na ito, naka-encrypt ng Android Keystore';

  @override
  String get remoteKeyStorageHelp =>
      'Naka-save lang sa telepono na ito, naka-encrypt ng Android Keystore. Sinusuportahan ang Ed25519, RSA at ECDSA.';

  @override
  String get remotePrivateKey => 'Private key';

  @override
  String get remoteShow => 'Ipakita';

  @override
  String get remoteImportKeyFile => 'I-import mula sa file';

  @override
  String get remotePrivateKeyPassword => 'Passphrase ng private key (opsyonal)';

  @override
  String get remoteStartCommand => 'Start command';

  @override
  String get remoteStartCommandHelp => 'Kung na-install gamit ang nvm, maaari mong ilagay ang buong path';

  @override
  String get remoteWorkingDirectory => 'Working directory (opsyonal)';

  @override
  String get remoteWorkingDirectoryHelp => 'Default na folder para sa mga bagong chat. Sinusuportahan ang ~/.';

  @override
  String get remoteHostFingerprint => 'Fingerprint ng host';

  @override
  String get remoteHostKeyNotConfirmed => 'Hindi pa nakumpirma';

  @override
  String get remoteHostKeyFirstCheck => 'Hihilingin sa iyong suriin ang fingerprint sa unang koneksyon';

  @override
  String get remoteDeleteHost => 'Burahin ang host na ito';

  @override
  String get remoteTesting => 'Sinusubukan';

  @override
  String get remoteTestConnection => 'Subukan';

  @override
  String get remoteHostedUpdateRequired => 'I-update ang JDK para mabuksan ang link na ito';

  @override
  String get remoteHostedCannotOpen => 'Hindi mabuksan ang link na ito';

  @override
  String get remoteOpening => 'Binubuksan…';

  @override
  String get remoteHostedNeverExpires => 'Hindi nag-e-expire';

  @override
  String get remoteHostedExpired => 'Nag-expire';

  @override
  String get remoteHostedExpiresToday => 'Mag-e-expire ngayong araw';

  @override
  String get remoteHostedExpiresTomorrow => 'Mag-e-expire bukas';

  @override
  String remoteHostedExpiresOn(String date) {
    return 'Mag-e-expire sa $date';
  }

  @override
  String get remoteHostedDeleteTitle => 'Burahin ang link na ito?';

  @override
  String remoteHostedDeleteBody(String title) {
    return 'Agad titigil sa paggana ang link para sa “$title”';
  }

  @override
  String get remoteHostedLinkDeleted => 'Nabura ang link';

  @override
  String get remoteUndo => 'I-undo';

  @override
  String get remoteHostedMyLinks => 'Mga ibinahagi kong link';

  @override
  String get remoteHostedNoLinks => 'Wala pang ibinahaging link';

  @override
  String get remoteHostedErrDeleteNetwork => 'Hindi mabura. Suriin ang iyong koneksyon at subukang muli.';

  @override
  String get remoteHostedErrDelete => 'Hindi mabura. Subukang muli mamaya.';

  @override
  String get remoteDirectoryPickerTitle => 'Pumili ng folder';

  @override
  String get remoteDirectoryChoose => 'Pumili';

  @override
  String get remoteDirectoryDefault => 'Default na working directory';

  @override
  String get remoteDirectoryHome => 'Home';

  @override
  String get remoteDirectoryPhoneStorage => 'Storage ng telepono';

  @override
  String get remoteDirectoryDownloads => 'Mga download';

  @override
  String get remoteDirectoryDownloadsPath => 'Storage ng telepono/Download';

  @override
  String get remoteDirectoryDocuments => 'Mga dokumento';

  @override
  String get remoteDirectoryDocumentsPath => 'Storage ng telepono/Documents';

  @override
  String get remoteDirectoryLocations => 'Mga lokasyon';

  @override
  String get remoteDirectoryRecent => 'Kamakailan';

  @override
  String get remoteDirectoryEnterPath => 'Maglagay ng path';

  @override
  String get remoteDirectoryGo => 'Pumunta';

  @override
  String get remoteDirectoryAbsolutePath => 'Ilagay ang buong path, simula sa “/”';

  @override
  String get remoteDirectoryNewFolder => 'Bagong folder';

  @override
  String remoteDirectoryParentCaption(String name) {
    return 'Sa “$name”';
  }

  @override
  String get remoteDirectoryFolderName => 'Pangalan ng folder';

  @override
  String get remoteDirectoryRoot => 'Root';

  @override
  String get remoteDirectoryErrCreate => 'Hindi malikha ang folder';

  @override
  String get remoteDirectoryNoSubfolders => 'Walang subfolder dito';

  @override
  String get remoteDirectoryHideHidden => 'Itago ang mga nakatagong folder';

  @override
  String remoteDirectoryShowHidden(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ipakita ang $count nakatagong folder',
      one: 'Ipakita ang 1 nakatagong folder',
    );
    return '$_temp0';
  }

  @override
  String get remoteDirectoryTruncated => 'Masyadong maraming folder. Ang mga una lang ang nakalista.';

  @override
  String get remoteWorkspaceAdd => 'Magdagdag ng workspace';

  @override
  String remoteWorkspaceAdded(String name) {
    return 'Naidagdag ang “$name”';
  }

  @override
  String get remoteWorkspaceErrAdd => 'Hindi maidagdag ang workspace';

  @override
  String get remoteWorkspaceNoChats => 'Walang chat';

  @override
  String remoteWorkspaceChatCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count chat', one: '1 chat');
    return '$_temp0';
  }

  @override
  String get remoteWorkspaceErrRename => 'Hindi mapalitan ang pangalan';

  @override
  String remoteWorkspaceRemoved(String name) {
    return 'Inalis ang “$name”';
  }

  @override
  String get remoteWorkspaceErrRemove => 'Hindi maalis ang workspace';

  @override
  String get remoteWorkspaceRename => 'Palitan ang pangalan ng workspace';

  @override
  String get remoteWorkspaceName => 'Pangalan ng workspace';

  @override
  String get remoteWorkspaceNameRequired => 'Bigyan ito ng pangalan';

  @override
  String remoteWorkspaceRemoveTitle(String name) {
    return 'Alisin ang “$name”?';
  }

  @override
  String get remoteWorkspaceRemoveBody => 'Mananatili ang folder at mga chat';

  @override
  String get remoteWorkspaceRemove => 'Alisin';

  @override
  String get remoteWorkspace => 'Workspace';

  @override
  String get remoteWorkspaceNewChatHere => 'Bagong chat dito';

  @override
  String get remoteWorkspaceUnpin => 'I-unpin';

  @override
  String get remoteWorkspaceGroup => 'Grupo';

  @override
  String get remoteWorkspaceUngrouped => 'Walang grupo';

  @override
  String get remoteWorkspaceRemoveAction => 'Alisin ang workspace';

  @override
  String get remoteWorkspaceNewGroup => 'Bagong grupo';

  @override
  String get remoteWorkspaceGroupName => 'Pangalan ng grupo';

  @override
  String remoteDirectoryPhonePath(String path) {
    return 'Storage ng telepono/$path';
  }

  @override
  String get remoteDirectoryInvalidName => 'Hindi maaaring maglaman ng “/” ang pangalan';

  @override
  String get remoteWorkspaceErrNameConflict => 'May workspace nang may ganitong pangalan';

  @override
  String get remoteWorkspaceErrInvalidPath => 'Hindi magagamit na workspace ang folder na ito';

  @override
  String get remoteWorkspaceErrNotFound => 'Wala na ang workspace na ito';

  @override
  String get remoteDirectoryErrUnreadable => 'Hindi mabuksan ang folder na ito';

  @override
  String get remoteDirectoryErrExists => 'May folder nang may ganitong pangalan';

  @override
  String get remoteDirectoryErrUnavailable => 'Hindi makapag-browse ng mga folder dito ang host na ito';

  @override
  String get remoteWorkspaceErrUnsupported => 'Hindi sinusuportahan ng host na ito ang aksyong ito';

  @override
  String get remoteWorkspaceAllChats => 'Lahat ng chat';

  @override
  String remoteWorkspaceSwitcherSemantics(String name) {
    return 'Workspace: $name. Lumipat ng workspace';
  }

  @override
  String get remoteWorkspaceManage => 'Pamahalaan ang mga workspace';

  @override
  String get remoteWorkspaceErrLoad => 'Hindi ma-load ang mga workspace';

  @override
  String get remoteWorkspaceEmpty => 'Wala pang workspace';

  @override
  String get remoteWorkspaceEmptyHint => 'Idagdag ang mga folder na pinakamadalas mong gamitin';

  @override
  String remoteWorkspaceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count workspace', one: '1 workspace');
    return '$_temp0';
  }

  @override
  String remoteDirectoryConfirmFolder(String action, String name) {
    return '$action “$name”';
  }

  @override
  String remoteHostKeyMismatchDetail(String saved, String received, String type) {
    return 'Kung na-reinstall o napalitan ang host, i-reset ang fingerprint nito sa mga setting ng host.\nNa-save: $saved\nNatanggap: $received ($type)';
  }

  @override
  String remoteForumCompactReplies(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label sagot', one: '$label sagot');
    return '$_temp0';
  }

  @override
  String remoteForumCompactViews(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label view', one: '$label view');
    return '$_temp0';
  }

  @override
  String remoteForumYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteHostedMonthDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String remoteHostedYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteForumTenThousands(String value) {
    return '$value × 10,000';
  }

  @override
  String get remoteForumSemanticsSeparator => ',';

  @override
  String remoteHostKeyVerifyCommand(String command) {
    return 'Patakbuhin ang $command sa host na iyon para makita ang parehong fingerprint. Tatanggi ang JDK na kumonekta kung magbago ito.';
  }

  @override
  String remoteSshInstallCommand(String command) {
    return 'Hindi naka-install ang JDK? Patakbuhin ang $command sa host.';
  }

  @override
  String remoteRelayProvider(String project) {
    return 'Serbisyo ng $project';
  }

  @override
  String remoteRelayProviderServer(String project, String server) {
    return 'Serbisyo ng $project · Kasalukuyang server: $server';
  }

  @override
  String remoteQuotedHostName(String name) {
    return '“$name”';
  }

  @override
  String remoteErrorDetail(String message, String detail) {
    return '$message ($detail)';
  }

  @override
  String get remotePathLan => 'LAN';

  @override
  String get remotePathP2p => 'P2P';

  @override
  String get remoteNetworkDetails => 'Mga detalye ng network';

  @override
  String get remoteNetworkAutomatic =>
      'Awtomatikong sinusubukan ang LAN → P2P → TURN → Relay, na may end-to-end encryption sa lahat ng oras.';

  @override
  String get remoteNetworkCurrentPath => 'Kasalukuyang path';

  @override
  String get remoteNetworkConnectDuration => 'Oras ng koneksyon';

  @override
  String get remoteNetworkRoundTripTime => 'Round-trip time (RTT)';

  @override
  String get remoteNetworkUnmeasured => 'Hindi nasukat';

  @override
  String get remoteNetworkUnknownPath => 'Hindi nakumpirma';

  @override
  String remoteNetworkMilliseconds(int value) {
    return '$value ms';
  }

  @override
  String get remoteNetworkMeasure => 'I-refresh ang network / sukatin ang latency';

  @override
  String get remoteNetworkMeasuring => 'Sinusukat…';

  @override
  String get remoteNetworkMeasureFailed => 'Hindi masukat ang latency. Subukang muli mamaya.';

  @override
  String get remoteNetworkDisconnected => 'Naka-disconnect. Kumonekta muli para masukat ang latency.';

  @override
  String get remoteNetworkFallback => 'Dahilan ng fallback';

  @override
  String get remoteNetworkFallbackUnknown =>
      'Hindi available ang direktang koneksyon; awtomatikong pumili ng available na ruta.';

  @override
  String get remoteNetworkFallbackWebrtcUnavailable =>
      'Hindi available ang WebRTC sa device na ito; gumagamit ng Relay.';

  @override
  String get remoteNetworkFallbackDirectFailed =>
      'Hindi makakonekta ang LAN / P2P; sinubukan ang susunod na available na ruta.';

  @override
  String get remoteNetworkFallbackDirectTimeout =>
      'Nag-time out ang LAN / P2P; sinubukan ang susunod na available na ruta.';

  @override
  String get remoteNetworkFallbackDirectRecentlyFailed =>
      'Nabigo ang kamakailang direktang pagtatangka; gumagamit ng available na relay para sa koneksyong ito.';

  @override
  String get remoteNetworkFallbackTurnUnavailable => 'Hindi available ang TURN; gumagamit ng Relay.';

  @override
  String get remoteNetworkFallbackTurnFailed => 'Hindi makakonekta ang TURN; gumagamit ng Relay.';

  @override
  String get remoteNetworkFallbackTurnTimeout => 'Nag-time out ang TURN; gumagamit ng Relay.';

  @override
  String get remoteNetworkFallbackPathUnverified => 'Hindi pa nakumpirma ang uri ng ruta ng WebRTC.';

  @override
  String get remoteNetworkSnapshotHint =>
      'Ipinapakita ang huling nakumpirmang ruta at latency. I-refresh para suriing muli.';

  @override
  String get remoteNetworkObservedAt => 'Huling sinuri';

  @override
  String get remoteNetworkLocalIpVersion => 'Bersyon ng ICE IP ng telepono';

  @override
  String get remoteNetworkRemoteIpVersion => 'Bersyon ng ICE IP ng host';

  @override
  String get remoteNetworkIceProtocol => 'ICE protocol';

  @override
  String get remoteTransferSettings => 'Remote transfer';

  @override
  String get remoteCompactHistory => 'Compact history';

  @override
  String get remoteErrHistoryModeChanged =>
      'Hindi na sinusuportahan ng Host ang compact history. Lumipat sa ibang host at bumalik, o i-restart ang app, para i-reload ang history.';

  @override
  String get remoteCompactHistoryHint =>
      'Binabawasan ang mga makasaysayang detalye ng tool sa mga sumusuportang JDK Remote Host; nananatiling hindi nagbabago ang mga live na sagot at pag-apruba. Lumipat ng host o i-restart ang app para mailapat. Pinananatili ng mas lumang Host ang buong history.';

  @override
  String get searchKwRemoteCompactHistory => 'compact slim lite history tools transfer bandwidth remote';

  @override
  String get remotePairEntry => 'I-pair ang computer sa pamamagitan ng pag-scan';

  @override
  String get remotePairEntryHint =>
      'I-scan ang code na ipinapakita ng Remote plugin sa iyong computer. Hindi kailangan ng Remote account; mag-sign in muna sa DeepSeek.';

  @override
  String get remotePairAddComputer => 'Magdagdag ng computer sa pamamagitan ng pag-scan';

  @override
  String get remotePairTitle => 'I-pair ang computer';

  @override
  String get remotePairSubtitle =>
      'Hindi kailangan ng Remote account. Hindi kailanman ipinapadala ang iyong DeepSeek password at mga sign-in token.';

  @override
  String get remotePairNeedsDeepSeek => 'Mag-sign in muna sa DeepSeek';

  @override
  String get remotePairNeedsDeepSeekBody =>
      'Nangangailangan ang pairing ng DeepSeek account na naka-sign in sa JDK-Go. Ang account ID lang nito ang kasama, para lagyan ng label ang telepono na ito; walang password, cookie o token.';

  @override
  String get remotePairScanHint =>
      'Itutok ang camera sa pairing code na ipinapakita ng Remote plugin sa iyong computer';

  @override
  String get remotePairPasteLink => 'I-paste ang pairing link';

  @override
  String get remotePairPasteEmpty => 'Walang pairing link sa clipboard';

  @override
  String get remotePairScannerFailed =>
      'Hindi available ang QR reader. I-paste ang pairing link para magpatuloy sa pairing.';

  @override
  String get remotePairFromImage => 'Mula sa mga larawan';

  @override
  String get remotePairImageNoCode => 'Walang nakitang QR code sa larawang iyon';

  @override
  String get remotePairCameraDenied =>
      'Walang access sa camera. I-on ito sa system settings, o gamitin ang Mula sa mga larawan o I-paste ang pairing link.';

  @override
  String get remotePairCameraFailed =>
      'Hindi nabuksan ang camera. Gamitin ang Mula sa mga larawan o I-paste ang pairing link.';

  @override
  String get remotePairReading => 'Binabasa ang pairing code…';

  @override
  String get remotePairConfirmTitle => 'Kumonekta sa computer na ito?';

  @override
  String get remotePairComputer => 'Computer';

  @override
  String get remotePairServer => 'Server';

  @override
  String get remotePairFingerprint => 'Fingerprint ng computer';

  @override
  String get remotePairFingerprintHint =>
      'Tiyaking tugma ito sa fingerprint sa Remote plugin sa iyong computer bago magpatuloy.';

  @override
  String get remotePairConfirm => 'Ito ang computer, i-pair';

  @override
  String get remotePairNotThis => 'Hindi ito, mag-scan muli';

  @override
  String get remotePairClaiming => 'Kumukuha ng verification code…';

  @override
  String get remotePairCodeTitle => 'Ilagay ang 8-digit na code na ito sa computer';

  @override
  String remotePairCodeSemantics(String digits) {
    return 'Verification code $digits';
  }

  @override
  String get remotePairCodeHint =>
      'I-type ito sa Remote plugin sa iyong computer, saka i-click ang Confirm binding. Wala nang kailangang gawin sa telepono.';

  @override
  String get remotePairOneAttempt =>
      'Isang pagtatangka lang: tatapusin ng maling code ang pairing na ito, at kakailanganin mo ng bagong code sa computer.';

  @override
  String remotePairWaiting(String countdown) {
    return 'Naghihintay sa computer · $countdown ang natitira';
  }

  @override
  String get remotePairApproved => 'Kinumpirma ng computer. Tinatapos…';

  @override
  String get remotePairCodeExpired => 'Nag-expire ang code. Magpakita ng bagong pairing code sa computer.';

  @override
  String remotePairConnecting(String name) {
    return 'Naka-pair. Kumokonekta sa $name…';
  }

  @override
  String get remotePairFailedTitle => 'Hindi maka-pair';

  @override
  String remotePairOtherServerBody(String server) {
    return 'Ang code na ito ay mula sa $server, hindi sa Remote server na ginagamit ngayon ng JDK-Go. Lumipat dito at magpatuloy? May sariling sign-in ang bawat server.';
  }

  @override
  String get remotePairSwitchServer => 'Lumipat ng server at magpatuloy';

  @override
  String get remotePairScanAgain => 'Mag-scan muli';

  @override
  String get remotePairErrInvalidCode => 'Hindi ito pairing code ng JDK-Go';

  @override
  String get remotePairErrOtherServer => 'Ang code na ito ay mula sa ibang Remote server';

  @override
  String get remotePairErrUnsupported =>
      'Hindi pa sinusuportahan ng Remote server na ito ang pairing sa pamamagitan ng pag-scan';

  @override
  String get remotePairErrExpired => 'Nag-expire o nagamit na ang code. Magpakita ng bagong pairing code sa computer.';

  @override
  String get remotePairErrCodeRejected =>
      'Maling code ang inilagay ng computer, kaya tapos na ang pairing na ito. Magpakita ng bagong pairing code sa computer at mag-scan muli.';

  @override
  String get remotePairErrCancelled => 'Kinansela ang pairing';

  @override
  String get remotePairErrAccountConflict =>
      'Naka-sign in ang telepono na ito sa ibang Remote account kaysa sa computer. Pinananatili ang sign-in na iyon; para lumipat, mag-sign out muna sa Remote.';

  @override
  String get remotePairErrIdentity =>
      'Hindi na tugma ang pairing sa computer na ito o sa telepono na ito, kaya huminto ito. Magpakita ng bagong pairing code sa computer.';

  @override
  String get remotePairErrHostLimit => 'Naabot na ng account na ito ang pinakamataas na bilang ng mga computer';

  @override
  String get remotePairErrNetwork => 'Hindi maabot ang Remote server. Suriin ang iyong network at subukang muli.';

  @override
  String get remotePairErrFailed => 'Hindi natapos ang pairing. Mag-scan muli.';

  @override
  String remotePairSwitchFailedTitle(String name) {
    return 'Naka-pair sa $name';
  }

  @override
  String get remotePairSwitchFailedBody =>
      'Ngunit hindi gumana ang paglipat dito. Subukang muli, o piliin ito sa ilalim ng Mga Remote host.';

  @override
  String get remotePairDone => 'Tapos na';

  @override
  String get remotePairErrPinSave =>
      'Naka-pair, ngunit hindi nai-store ng telepono na ito ang fingerprint ng computer. Magpakita ng bagong pairing code sa computer at i-scan itong muli.';

  @override
  String get stateWorkspaceFilesHint => 'Mga file na na-upload sa kasalukuyang workspace:';

  @override
  String get stateRemoteUploadNameInvalid =>
      'Tinanggihan ng host ang pangalan ng file. Paikliin ito o alisin ang mga espesyal na karakter at subukang muli.';

  @override
  String get stateRemoteUploadWorkspaceUnavailable => 'Walang masusulatang working directory ang chat na ito';

  @override
  String get stateRemoteUploadWorkspaceChanged => 'Nagbago ang working directory. Suriin ito bago mag-upload muli.';

  @override
  String get stateRemoteUploadLimit =>
      'Tinanggihan ng host ang upload. Suriin ang laki ng file o subukang muli mamaya.';

  @override
  String get stateRemoteUploadUnsupported =>
      'Hindi sinusuportahan ng host na ito ang pag-upload ng file. I-update ang Remote plugin nito at kumonekta muli.';

  @override
  String get stateRemoteUploadTooLarge => 'Lumampas ang file sa limitasyon sa laki ng remote upload protocol';

  @override
  String get riskDontShowAgain => 'Huwag nang ipakita muli';

  @override
  String get riskAskAi => 'Hindi sigurado? Magtanong sa AI';

  @override
  String get riskConfirmAlwaysAction => 'Laktawan ang kumpirmasyon';

  @override
  String get riskFullAccessAction => 'I-on ang Full access';

  @override
  String get riskAutoReviewAction => 'I-on ang Auto review';

  @override
  String get riskAllowForChatTitle => 'Payagan ang lahat sa chat na ito?';

  @override
  String get riskAllowForChatBody =>
      'Tatakbo nang walang tanong ang mga command at pagbabago sa chat na ito. I-off ito anumang oras sa itaas ng message box.';

  @override
  String get riskAllowForChatAction => 'Payagan lahat';

  @override
  String get riskPetOverlayTitle => 'Ipakita sa ibabaw ng ibang app?';

  @override
  String get riskPetOverlayBody =>
      'I-on ang “Display over other apps” para sa JDK-Go sa system settings para makalabas ang iyong pet sa labas ng app.';

  @override
  String get riskPetOverlayAction => 'Buksan ang settings';

  @override
  String get askAiTooltip => 'Magtanong sa AI';

  @override
  String get askAiHelpTitle => 'Tulong';

  @override
  String get askAiHelpSubtitle => 'Magtanong sa AI tungkol sa anumang narito';

  @override
  String askAiAboutApp(String question) {
    return 'Tungkol sa JDK-Go app: $question';
  }

  @override
  String askAiWithGuide(String question) {
    return 'Tungkol sa JDK-Go app: $question\nPakisagot ayon sa nakalakip na gabay.';
  }

  @override
  String get askAiNoGuide => 'Walang JDK-Go guide ang host na ito, kaya maaaring hindi tumpak ang mga sagot';

  @override
  String get askAiQuestionOverview => 'Ano ang kaya ng JDK-Go, at saan ako dapat magsimula?';

  @override
  String get askAiQuestionPhoneControl => 'Paano gumagana ang phone control, at ano ang mga panganib?';

  @override
  String get askAiQuestionPhoneAlways =>
      'Ano ang nagbabago sa “Laging laktawan ang kumpirmasyon” sa phone control, at paano ito mas mapanganib kaysa sa pagtatanong sa bawat pagkakataon?';

  @override
  String get askAiQuestionAppRules =>
      'Para saan ang listahan ng app sa phone control, at ano ang mga panganib ng pagpayag sa mga app ng bangko at pagbabayad?';

  @override
  String get askAiQuestionFullAccess => 'Ano ang mangyayari kapag naka-on ang full access, at ano ang mga panganib?';

  @override
  String get askAiQuestionPhoneFiles =>
      'Kapag naka-on ang “Access phone files”, aling mga file ang mababasa at mababago ng AI, at paano ito io-off?';

  @override
  String get askAiQuestionAllowForChat => 'Ano ang pinapayagan ng “Allow for chat”, at paano ito io-off?';

  @override
  String get askAiQuestionPlugins => 'Ano ang kaya ng mga plugin, at ano ang dapat bantayan sa mga third-party?';

  @override
  String get askAiQuestionRemote =>
      'Paano ko ikokonekta ang sarili kong computer o server, at paano ito naiiba sa telepono na ito?';

  @override
  String get phoneRuntimeUpgradeBase =>
      'Hindi makumpirma na tugma ang bagong engine sa iyong Linux environment, kaya huminto ang update. Hindi nabura ang iyong environment at mga naka-install na tool. Gumawa ng buong backup at makipag-ugnayan sa maintainer para sa migration; huwag i-reset o i-uninstall ang app.';

  @override
  String get phoneRuntimeUpgradeManifest =>
      'Hindi ligtas na matukoy ang runtime update manifest. Huminto ang update at pinanatili ang iyong environment. Suriin ang APK at makipag-ugnayan sa maintainer; huwag i-reset ang environment.';

  @override
  String get phoneRuntimeUpgradeInterrupted =>
      'Hindi kumpleto ang runtime upgrade. Pinanatili ang iyong data at recovery state. Subukang i-install muli. Kung nabibigo pa rin, i-export ang diagnostics at makipag-ugnayan sa maintainer; huwag i-reset o burahin ang mga recovery directory.';

  @override
  String get phoneRuntimeUpgradeSymlink =>
      'Pinalitan ng custom na link ang isang system path, kaya hindi ligtas na ma-update ang environment. Pinanatili ang iyong environment. I-backup ito at makipag-ugnayan sa maintainer.';

  @override
  String get phoneRuntimeUpgradeRunning =>
      'Hindi pa nakumpirmang huminto ang engine o ang naiwang proseso. Hindi pa nagsisimula ang update. Ihinto ang lokal na engine at hintaying matapos ang paglilinis bago subukang muli; huwag i-reset ang environment.';

  @override
  String get schemaDocumentationTitle => 'Paglalarawan ng mga field';

  @override
  String get schemaDocumentationOverview => 'Pangkalahatang-ideya';

  @override
  String get schemaDocumentationEach => 'Bawat item';

  @override
  String schemaDocumentationPosition(int position) {
    return 'Item $position';
  }

  @override
  String schemaDocumentationOption(int option) {
    return 'Opsyon $option';
  }

  @override
  String get searchApiKey => 'API Key';

  @override
  String get searchNeedsLocal => 'Available sa engine ng telepono na ito';

  @override
  String get searchNeedsPhoneControl => 'Available kapag naka-on ang phone control';

  @override
  String get searchNeedsNativeUi => 'Available sa native na interface';

  @override
  String get searchNeedsEngineField => 'Available kapag mayroon ito ang host';

  @override
  String get searchNeedsAnimations => 'Available kapag naka-on ang mga animation';

  @override
  String get searchNeedsChat => 'Available kapag may bukas na chat';

  @override
  String get searchKwTheme => 'appearance,colors,colours,accent,icons';

  @override
  String get searchKwPets => 'pet,pets,companion,whale,overlay';

  @override
  String get searchKwPerformance => 'battery,smooth,lag,lite,full,speed';

  @override
  String get searchKwVoice => 'speech recognition,dictation,microphone,mic,voice';

  @override
  String get searchKwNotifications => 'alerts,push,banner,sound';

  @override
  String get searchKwReplyPrefs => 'about me,style,tone,instructions,AGENTS.md';

  @override
  String get searchKwSharedLinks => 'links,share,shared,public link';

  @override
  String get searchKwPhone => 'accessibility,automation,tap,control phone';

  @override
  String get searchKwAppRules => 'apps,blocklist,allowlist,deny,app list';

  @override
  String get searchKwDnd => 'dnd,shizuku,sui,root,adb,background';

  @override
  String get searchKwEngine => 'engine,runtime,start,stop,restart,JDK';

  @override
  String get searchKwBackground => 'keep alive,background activity,battery optimization,autostart,killed';

  @override
  String get searchKwSystemAccess =>
      'permissions,grant,overlay,display over other apps,accessibility,background pop-ups,microphone,file access,notification permission,restricted settings';

  @override
  String get searchKwDiagnostics => 'logs,troubleshoot,report,bug,errors';

  @override
  String get searchKwModels => 'model providers,providers,provider,switch model,OpenRouter,ChatGPT,Claude';

  @override
  String get searchKwEngineParams => 'engine settings,advanced,parameters,subagent,commands';

  @override
  String get searchKwSubagent => 'subagent settings,depth,concurrency,subtasks';

  @override
  String get searchKwAgentLoop => 'loop,parallel,tool calls';

  @override
  String get searchKwShell => 'commands,timeout,output,terminal,shell,bash';

  @override
  String get searchKwWebSearch => 'search,internet,browse,api key';

  @override
  String get searchKwGeneral => 'general,web settings';

  @override
  String get searchKwPluginInventory => 'inventory,installed plugins,bundles';

  @override
  String get searchKwPlugins => 'extensions,market,install,marketplace';

  @override
  String get searchKwAllFeatures => 'features,catalog,everything';

  @override
  String get searchKwAccount => 'account,balance,top up,sign in,sign out,api key,usage,DeepSeek';

  @override
  String get searchKwRemote => 'remote,ssh,computer,server,JDK Remote,connect';

  @override
  String get searchKwPermission => 'permissions,approval,don\'t ask,read only,full access,auto-run commands';

  @override
  String get searchKwAgentPresets => 'presets,mode,agent mode';

  @override
  String get searchKwUiMode => 'native,web,web mode,interface';

  @override
  String get searchKwLanguage => 'chinese,english,locale';

  @override
  String get searchKwAutoCommands => 'don\'t ask,auto approve,full access,no confirmation';

  @override
  String get searchKwPhoneFiles => 'storage,files,downloads,photos';

  @override
  String get searchKwVisualReplies => 'charts,cards,visual,options';

  @override
  String get searchKwTextSize => 'font,font size,text size,larger text';

  @override
  String get searchKwTableTint => 'table,tint,header,stripe,row,background';

  @override
  String get searchKwFoldTurns => 'collapse,fold,steps';

  @override
  String get searchKwWebPhoneLayout => 'web phone layout,layout';

  @override
  String get searchKwShareConfig => 'share,export,share code,config';

  @override
  String get searchKwOpenWeb => 'web,browser,web ui';

  @override
  String get searchKwSafeMode => 'safe mode,leave safe mode,troubleshoot';

  @override
  String get searchKwVersion => 'version,about,build';

  @override
  String get searchKwUpdate => 'update,upgrade,new version';

  @override
  String get searchKwUpdateAuto => 'auto update,updates';

  @override
  String get searchKwHelp => 'help,guide,ask ai,how to';

  @override
  String get searchKwCommunity => 'group,forum,feedback,chat group';

  @override
  String get searchKwStar => 'github,star';

  @override
  String get searchKwLicenses => 'license,open source';

  @override
  String get searchKwDarkMode => 'dark,light,dark mode,night,theme,system,appearance';

  @override
  String get searchKwAccent => 'color,colour,accent,palette,wallpaper';

  @override
  String get searchKwTileStyle => 'icon style,tiles';

  @override
  String get searchKwAppIcon => 'launcher icon,icon';

  @override
  String get searchKwPetSize => 'pet size';

  @override
  String get searchKwPetQuiet => 'quiet,pet quiet';

  @override
  String get searchKwPetOutside => 'overlay,floating pet,outside app';

  @override
  String get searchKwPetDisplayWhen => 'pet display,when to show';

  @override
  String get searchKwBlur => 'blur,glass,frosted';

  @override
  String get searchKwAnimations => 'animation,motion,reduce motion';

  @override
  String get searchKwFluidMotion => 'fluid,spring,bounce,glow,smooth';

  @override
  String get searchKwNotifyEnabled => 'notifications on,turn off notifications';

  @override
  String get searchKwNotifyDone => 'reply done,finished';

  @override
  String get searchKwNotifyFailed => 'error,failed,stopped';

  @override
  String get searchKwNotifyApproval => 'approval,waiting for you';

  @override
  String get searchKwNotifyQuestion => 'question,asks you';

  @override
  String get searchKwNotifyLive =>
      'dynamic island,live update,live activity,status bar chip,now bar,live alerts,lock screen progress';

  @override
  String get searchKwNotifySystem => 'sound,banner,lock screen,system';

  @override
  String get searchKwPhoneConfirm => 'don\'t ask,confirm,always ask,no confirmation';

  @override
  String get searchKwPhoneAutoCollapse => 'floating bar,collapse,bubble';

  @override
  String get searchKwPhoneReturn => 'return,come back';

  @override
  String get searchKwPhoneBackgroundGuide => 'background confirmation,return';

  @override
  String get searchKwAutoStart => 'auto start,launch';

  @override
  String get searchKwAutoSafe => 'safe mode,automatic safe mode';

  @override
  String get searchKwEngineReset => 'reset,wipe,restore';

  @override
  String get searchKwEngineUninstall => 'uninstall,remove,free space';

  @override
  String get searchKwWorkspaceRecovery => 'workspace,index,recovery,rescue,missing chats,chats won\'t open';

  @override
  String get searchKwAddProvider => 'add model,new provider,custom model,base url';

  @override
  String get searchKwSubagentDepth => 'depth,levels';

  @override
  String get searchKwParallelCalls => 'parallel,concurrent calls';

  @override
  String get searchKwCommandTimeout => 'timeout,time limit';

  @override
  String get searchKwWebSearchKey => 'search key,web search key';

  @override
  String get searchKwChatLogUpload => 'privacy,logs,upload logs,telemetry';

  @override
  String get searchKwAddSshHost => 'ssh,add host,connect computer';

  @override
  String get searchKwRemoteAutoConnect => 'auto connect,on launch';

  @override
  String get searchKwPermissionCurrent => 'allow for this chat,this chat';

  @override
  String get searchKwPermissionDefault =>
      'default permission,read only,workspace,full access,auto-run commands,don\'t ask';

  @override
  String get searchSettingsHint => 'Maghanap ng mga setting';

  @override
  String get searchSuggestDark => 'Dark mode';

  @override
  String get searchSuggestBackground => 'Background';

  @override
  String get searchSuggestPermission => 'Mga pahintulot';

  @override
  String get searchSuggestTextSize => 'Laki ng teksto';

  @override
  String get searchCommon => 'Karaniwan';

  @override
  String get searchRecent => 'Kamakailan';

  @override
  String get searchFeatures => 'Mga feature';

  @override
  String get searchNoResults => 'Walang tumutugmang setting';

  @override
  String searchAskAi(String query) {
    return 'Magtanong sa AI: “$query”';
  }

  @override
  String get searchKwPersonalization => 'personalization,preferences,style';

  @override
  String get searchKwInterface => 'native,web,web mode,web app,general';

  @override
  String get searchKwPrivacy => 'privacy,data,logs,sharing,statistics';

  @override
  String get searchKwAbout => 'about,version,update,licenses';

  @override
  String get searchKwPhoneConfirmEntry => 'confirmation,phone control,don\'t ask';

  @override
  String get searchKwWebCodingView => 'coding view,work view,web';

  @override
  String get searchKwWebCollapse => 'work steps,collapse,web';

  @override
  String get searchKwWebBusySend => 'send,queue,while AI works';

  @override
  String get searchKwPluginsMarket => 'plugin market,install plugins,marketplace';

  @override
  String get searchKwUsageStats => 'statistics,stats,usage data,analytics,telemetry,anonymous,privacy,data';

  @override
  String get searchKwQuickPanel => 'swipe,left swipe,shortcuts,gesture,quick panel,quick access';

  @override
  String get selfUpdateTransport => 'Ruta ng pag-install';

  @override
  String get selfUpdateSystem => 'Normal na pag-install (default)';

  @override
  String get selfUpdateShizuku => 'Shizuku';

  @override
  String get selfUpdateAdb => 'Local ADB';

  @override
  String get selfUpdateSecurityNote =>
      'Nananatiling napapailalim ang bawat ruta sa mga lagda ng APK at mga patakaran sa seguridad ng Android/vendor. Hindi garantisado ang paglaktaw sa mga scan. Hindi sinusuportahan ang root; hindi kailanman awtomatikong lumilipat ang mga ruta pagkatapos ng pagkabigo.';

  @override
  String get selfUpdateNativeConfirm =>
      'Ang na-verify na update lang para sa app na ito ang ini-install, na nangangailangan pa rin ng native na kumpirmasyon. Hindi inaaprubahan ng pag-authorize sa Shizuku ang pag-install. Maaaring manatiling naka-off ang Phone control at AI Shell.';

  @override
  String get selfUpdateAuthorize => 'Humiling ng awtorisasyon ng Shizuku para sa mga update';

  @override
  String get selfUpdateRefresh => 'I-refresh ang katayuan ng transport';

  @override
  String selfUpdateShizukuStatus(String status) {
    return 'Shizuku: $status';
  }

  @override
  String get selfUpdateReady => 'Awtorisado';

  @override
  String get selfUpdatePermissionRequired => 'I-install, simulan at i-authorize muna ang Shizuku';

  @override
  String get selfUpdateUnsupportedIdentity =>
      'Shell UID 2000 lang ang sinusuportahan; hindi sinusuportahan ang root at ibang pagkakakilanlan';

  @override
  String get selfUpdateAdbHint =>
      'Gamitin ang naka-pair na wireless-debugging identity ng telepono na ito; magsisimula lang ang koneksyon kapag pinindot mo ang Install. Kung hindi naka-pair, buksan ang umiiral na pahina ng pairing ng Android Shell nang hindi ina-enable ang Phone control o AI Shell. Hindi sine-save o nilolog ang mga pairing code at port.';

  @override
  String get selfUpdatePairing => 'Buksan ang gabay sa pairing ng Android Shell';

  @override
  String get selfUpdateAdbPaired => 'Naka-pair ang Local ADB';

  @override
  String get selfUpdateAdbNotPaired => 'Hindi naka-pair ang Local ADB';

  @override
  String get selfUpdatePendingTitle => 'Bine-verify ang resulta ng pag-install';

  @override
  String get selfUpdatePendingMessage =>
      'Maaaring tumatakbo pa ang pag-install. Walang awtomatikong pagsubok muli o paglipat ng ruta. Suriin ang mga system prompt, saka basahin ang aktwal na naka-install na estado.';

  @override
  String get selfUpdateUnknownTitle => 'Hindi alam ang resulta ng pag-install';

  @override
  String get selfUpdateUnknownMessage =>
      'Hindi nagpapatunay ng pagkabigo ang timeout, nawalang koneksyon o prosesong lumabas. Walang awtomatikong pagsubok muli o paglipat ng ruta. Basahin muna ang aktwal na naka-install na estado.';

  @override
  String get selfUpdateReadResult => 'Basahin ang aktwal na naka-install na estado';

  @override
  String get selfUpdateVerifiedTitle => 'Na-verify ang naka-install na bersyon';

  @override
  String selfUpdateVerifiedVersion(String version, int code) {
    return 'Kasalukuyang bersyon $version (build $code), na-verify ng native layer.';
  }

  @override
  String get selfUpdateFailedTitle => 'Hindi natapos ang pag-install';

  @override
  String get selfUpdateFailedMessage =>
      'Iniulat ng native layer na nabigo ang pag-install na ito. Suriin ang mga system prompt at ang error code, saka tahasang pumili ng ruta ng pag-install.';

  @override
  String selfUpdateErrorCode(String code) {
    return 'Error code: $code';
  }

  @override
  String get selfUpdateEndWaiting => 'Tapusin ang paghihintay na ito';

  @override
  String get selfUpdateEndWaitingNote =>
      'Tapusin lang ang paghihintay na ito pagkatapos makumpirmang hindi na nag-i-install ang system. Hindi kinakansela ng pag-clear ng talaan ang pag-install ng system o muling sinusubukan/nililipat ang mga ruta. Kailangan muli ang native na kumpirmasyon.';

  @override
  String get shellDeletePermanently => 'Burahin nang tuluyan';

  @override
  String get shellDeleteNoUndo => 'Hindi na maibabalik; hindi ito archive';

  @override
  String get shellDeleteChecking => 'Sinusuri kung sinusuportahan ng host na ito ang permanenteng pagbura…';

  @override
  String get shellDeleteUnsupported =>
      'Hindi sinusuportahan ng host na ito ang ligtas na permanenteng pagbura. Available pa rin ang Archive.';

  @override
  String get shellDeleteUnavailable =>
      'Hindi available ang ligtas na permanenteng pagbura. Kumonekta muli o i-update ang host na ito; walang na-archive bilang kapalit.';

  @override
  String shellDeleteChatConfirmation(String title) {
    return 'Burahin nang tuluyan ang “$title”?';
  }

  @override
  String shellDeleteChatsConfirmation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Burahin nang tuluyan ang $count chat?',
      one: 'Burahin nang tuluyan ang 1 chat?',
    );
    return '$_temp0';
  }

  @override
  String get shellDeleteWarning =>
      'Buburahin nang tuluyan sa host na ito ang kasaysayan ng mga napiling chat. Hindi ito maibabalik at hindi ito archive.\n\nPinananatili ang mga working directory, nabuong file, fork, ibinahaging attachment at nailathalang cloud share. Kailangang alisin nang hiwalay ang mga cloud share. Maaaring tanggihan ng host ang mga aktibo o kaugnay na chat.';

  @override
  String get shellDeleteOwnerChanged =>
      'Nagbago ang host o koneksyon. Kanselahin at simulan muli ang pagbura; hindi na wasto ang lumang kumpirmasyon.';

  @override
  String get shellDeletingChats => 'Binubura ang mga chat…';

  @override
  String shellChatsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nabura nang tuluyan ang $count chat',
      one: 'Nabura nang tuluyan ang 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellDeletePartial(int deleted, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      deleted,
      locale: localeName,
      other: 'Nabura ang $deleted chat',
      one: 'Nabura ang 1 chat',
    );
    String _temp1 = intl.Intl.pluralLogic(failed, locale: localeName, other: '$failed ang nabigo', one: '1 ang nabigo');
    return '$_temp0; $_temp1';
  }

  @override
  String get shellDeleteRunning =>
      'Ihinto ang tumatakbong gawain bago burahin. Sinusuri rin ng host ang mga aktibong gawain at iskedyul.';

  @override
  String get shellDeleteRelated =>
      'May kaugnay na gawain ng subagent ang chat na ito. Tinanggihan ng host ang pagbura para protektahan ito.';

  @override
  String get shellDeleteWriterHeld => 'May ibang prosesong gumagamit ng chat na ito. Isara ito doon at subukang muli.';

  @override
  String get shellDeleteNotFound => 'Wala na ang chat sa host na ito. I-refresh ang listahan.';

  @override
  String get shellDeleteConnectionLost =>
      'Nawala ang koneksyon at hindi nakumpirma ang resulta ng pagbura. I-refresh ang listahan ng chat bago gumawa ng karagdagang hakbang.';

  @override
  String get shellDeleteArchivePending => 'May nakabinbing operasyon ng archive. Tapusin o i-undo ito bago burahin.';

  @override
  String get shellDeleteInventoryChanged => 'Nagbago ang listahan ng chat. I-refresh at piliin muli ang mga chat.';

  @override
  String get shellDeleteProtocolError =>
      'Hindi nakumpirma ang resulta ng pagbura. I-refresh ang listahan ng chat bago gumawa ng karagdagang hakbang.';

  @override
  String get shellDeleteNotAttempted => 'Hindi sinubukan. Suriin ang listahan ng chat bago subukang muli.';

  @override
  String get shellDeleteFailed => 'Hindi makumpirma ng host ang pagbura. I-refresh bago subukang muli.';

  @override
  String get setupAppearanceTitle => 'Pumili ng hitsura';

  @override
  String get setupAppearanceMessage => 'Maaari mo itong baguhin anumang oras sa Settings';

  @override
  String get setupLightMode => 'Magaan na mode';

  @override
  String get setupCapsulePreparing => 'Inihahanda ang runtime';

  @override
  String setupCapsuleProgress(int percent) {
    return 'Runtime $percent%';
  }

  @override
  String setupCapsuleProgressSemantics(int percent) {
    return 'Inihahanda ang runtime, $percent% na ang tapos';
  }

  @override
  String get setupCapsuleReady => 'Handa na ang runtime';

  @override
  String get setupCapsuleFailed => 'Nabigo ang pag-install';

  @override
  String get setupWaitingBody => 'Magpapatuloy nang kusa kapag handa na';

  @override
  String get setupNotifyWhenDone => 'Aabisuhan ka namin kapag tapos na';

  @override
  String get setupAwaitSignIn => 'Magbubukas ang DeepSeek sign-in kapag handa na';

  @override
  String get shellApiKeyPrefixWarning =>
      'Karaniwang nagsisimula sa sk- ang mga DeepSeek key. Tiyaking tama ang nakopya mong key.';

  @override
  String get shellApiKeyIncompleteWarning => 'Mukhang hindi kumpleto ang key na ito. Tiyaking nakopya mo ang lahat.';

  @override
  String get shellBrowserUrlCopied => 'Hindi mabuksan ang iyong browser. Nakopya ang URL.';

  @override
  String get shellSaveTryAgain => 'Hindi na-save. Subukang muli.';

  @override
  String get shellApiKeyUpdated => 'Na-update ang API key';

  @override
  String get shellReplaceApiKey => 'Palitan ang API key';

  @override
  String get shellEnterApiKey => 'Ilagay ang API key';

  @override
  String get shellApiKeyBilling => 'Sinisingil ng DeepSeek platform ayon sa paggamit';

  @override
  String get shellSaving => 'Sine-save';

  @override
  String get shellSaveContinue => 'I-save at magpatuloy';

  @override
  String get shellSetUpLater => 'I-set up mamaya';

  @override
  String get shellClearField => 'I-clear';

  @override
  String get shellShow => 'Ipakita';

  @override
  String get shellApiKeyEncrypted => 'Naka-encrypt sa telepono na ito';

  @override
  String get shellGetApiKey => 'Kumuha ng API key';

  @override
  String get shellConnectDeepSeek => 'Ikonekta ang DeepSeek';

  @override
  String get shellConnectDeepSeekMessage => 'Mag-sign in sa DeepSeek para magsimula. Hindi kailangan ng API key.';

  @override
  String get shellAccountSignInUnsupported => 'Hindi sinusuportahan ng engine na ito ang pag-sign in sa account';

  @override
  String get shellSignInDeepSeek => 'Mag-sign in gamit ang DeepSeek';

  @override
  String get shellUseApiKey => 'Gamitin ang API key';

  @override
  String get shellOtherProviders => 'Ibang provider';

  @override
  String shellOnboardingStep(int step, int steps) {
    return 'Hakbang $step sa $steps';
  }

  @override
  String get shellRuntimeUpdating => 'Ina-update ang runtime';

  @override
  String get shellRuntimePreparing => 'Inihahanda ang runtime';

  @override
  String get shellRuntimeReady => 'Handa na';

  @override
  String get shellRuntimeIncomplete => 'Hindi kumpleto ang pag-install';

  @override
  String get shellRuntimeFilesKept => 'Mananatili ang iyong mga chat at file';

  @override
  String get shellRuntimeFirstSetup => 'Isa o dalawang minuto ang unang setup';

  @override
  String get shellRuntimeContinuing => 'Magpapatuloy sa ilang sandali';

  @override
  String get shellRuntimeRestoreFailed => 'Hindi maibalik ang na-save na nilalaman';

  @override
  String get shellRuntimeExtractFailed => 'Hindi ma-extract ang mga file';

  @override
  String get shellInstallLogs => 'Mga log ng pag-install';

  @override
  String get shellRuntimeLocalOnly => 'Lahat ay tumatakbo sa telepono na ito';

  @override
  String get shellRuntimeContinueWithoutKept => 'Magpatuloy nang hindi nagre-restore';

  @override
  String get shellRuntimeAlmostDone => 'Malapit na';

  @override
  String shellRuntimeSecondsRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Humigit-kumulang $count segundo',
      one: 'Humigit-kumulang 1 segundo',
    );
    return '$_temp0';
  }

  @override
  String shellRuntimeMinutesRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Humigit-kumulang $count minuto',
      one: 'Humigit-kumulang 1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get shellEngineLogs => 'Mga log ng engine';

  @override
  String get shellWelcomeMessage => 'Ang DeepSeek agent,\nnasa bulsa mo';

  @override
  String get shellGetStarted => 'Magsimula';

  @override
  String get shellSearchChats => 'Maghanap ng mga chat';

  @override
  String get shellCollapseChatList => 'I-collapse ang listahan ng chat';

  @override
  String get shellExpandChatList => 'Palawakin ang listahan ng chat';

  @override
  String get shellChatList => 'Mga chat';

  @override
  String get shellChatDetails => 'Mga detalye ng chat';

  @override
  String get shellCollapseDetails => 'I-collapse ang mga detalye';

  @override
  String get shellExpand => 'Palawakin';

  @override
  String get shellUndo => 'I-undo';

  @override
  String shellFolderDeleted(String name) {
    return 'Nabura ang “$name”';
  }

  @override
  String shellMovedToFolder(String name) {
    return 'Inilipat sa “$name”';
  }

  @override
  String get shellMovedOutOfFolder => 'Inilabas sa folder';

  @override
  String get shellUnpinFailed => 'Hindi ma-unpin. Subukang muli mamaya.';

  @override
  String get shellPinFailed => 'Hindi ma-pin. Subukang muli mamaya.';

  @override
  String shellChatsUnpinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-unpin ang $count chat',
      one: 'Na-unpin ang 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellChatsPinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-pin ang $count chat',
      one: 'Na-pin ang 1 chat',
    );
    return '$_temp0';
  }

  @override
  String get shellArchiveFailed => 'Hindi ma-archive. Subukang muli mamaya.';

  @override
  String shellChatsStoppedArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Itinigil at na-archive ang $count chat',
      one: 'Itinigil at na-archive ang 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellChatsArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-archive ang $count chat',
      one: 'Na-archive ang 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellFilterLabel(String label) {
    return 'Filter: $label';
  }

  @override
  String get shellFolders => 'Mga folder';

  @override
  String get shellNoRunningChats => 'Walang tumatakbong chat';

  @override
  String get shellNoPendingChats => 'Walang chat na nangangailangan ng pag-apruba';

  @override
  String get shellNoUnreadChats => 'Walang hindi pa nababasang chat';

  @override
  String get shellNoChatsYet => 'Wala pang chat';

  @override
  String shellFolderLabel(String name) {
    return 'Folder “$name”';
  }

  @override
  String shellFolderChatCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Folder “$name”, $count chat',
      one: 'Folder “$name”, 1 chat',
    );
    return '$_temp0';
  }

  @override
  String get shellSort => 'Ayusin';

  @override
  String get shellRecentActivity => 'Kamakailang aktibidad';

  @override
  String get shellCreatedTime => 'Petsa ng paglikha';

  @override
  String get shellNewFolder => 'Bagong folder';

  @override
  String get shellManageFolders => 'Pamahalaan ang mga folder';

  @override
  String get shellMultiSelect => 'Pumili';

  @override
  String get shellFolderNameExists => 'May folder nang may ganitong pangalan';

  @override
  String get shellEditFolder => 'I-edit ang folder';

  @override
  String get shellFolderMark => 'Markahan';

  @override
  String shellFolderColor(int number) {
    return 'Kulay $number';
  }

  @override
  String get shellMoveToFolder => 'Ilipat sa folder';

  @override
  String get shellMoveOutOfFolder => 'Ilabas sa folder';

  @override
  String get shellDeleteFolder => 'Burahin ang folder';

  @override
  String get shellDragToReorder => 'I-drag para ayusin muli';

  @override
  String get shellSelectChats => 'Pumili ng mga chat';

  @override
  String shellSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count ang napili', one: '1 ang napili');
    return '$_temp0';
  }

  @override
  String get shellDeselectAll => 'Alisin ang lahat ng pagpili';

  @override
  String get shellSelectAll => 'Piliin lahat';

  @override
  String get shellUnpin => 'I-unpin';

  @override
  String get shellArchive => 'I-archive';

  @override
  String get shellCurrentlyRunning => 'Tumatakbo';

  @override
  String get shellUnread => 'Hindi pa nababasa';

  @override
  String get shellPinned => 'Naka-pin';

  @override
  String get shellEngineNotRunning => 'Hindi tumatakbo ang engine';

  @override
  String shellHostNotConnected(String name) {
    return 'Hindi pa nakakonekta sa “$name”';
  }

  @override
  String get shellSearchAfterConnecting => 'Kumonekta para maghanap';

  @override
  String get shellChatsLoadFailed => 'Hindi ma-load ang mga chat';

  @override
  String shellSearchHostChats(String name) {
    return 'Maghanap ng mga chat sa “$name”';
  }

  @override
  String get shellSearchTitlesHint => 'Maghanap ng mga pamagat, kasama ang mga na-archive na chat';

  @override
  String get shellSearchContentHint => 'Maghanap ng mga pamagat at nilalaman, kasama ang mga na-archive na chat';

  @override
  String get shellLoadingChatsEllipsis => 'Nilo-load ang mga chat…';

  @override
  String get shellNoMatchingChats => 'Walang tumutugmang chat';

  @override
  String get shellSearchDifferentKeywords => 'Sumubok ng ibang keyword, o paghiwalayin ang mga salita ng espasyo';

  @override
  String get shellArchived => 'Na-archive';

  @override
  String get shellRestoreBeforeOpening => 'Ibalik ang na-archive na chat na ito para mabuksan';

  @override
  String get shellRestoreAndOpen => 'Ibalik at buksan';

  @override
  String get shellRestoreFailed => 'Hindi maibalik. Subukang muli mamaya.';

  @override
  String get shellSearchingMessages => 'Hinahanap ang nilalaman ng mensahe…';

  @override
  String get shellHostTitleSearchOnly => 'Paghahanap sa pamagat lang ang sinusuportahan ng host na ito';

  @override
  String get shellContentSearchFailed => 'Hindi mahanap ang nilalaman. Mga tugma sa pamagat lang ang ipinapakita.';

  @override
  String get shellContentSearchLimit => 'Ipinapakita ng paghahanap sa nilalaman ang 20 pinakaangkop na chat';

  @override
  String get shellMoveToOtherFolder => 'Ilipat sa ibang folder';

  @override
  String get shellArchiveStopsTurn => 'Titigil ang kasalukuyang turn';

  @override
  String get shellRenameFailed => 'Hindi mapalitan ang pangalan. Subukang muli mamaya.';

  @override
  String shellChatStoppedArchived(String title) {
    return 'Itinigil at na-archive ang “$title”';
  }

  @override
  String shellChatArchived(String title) {
    return 'Na-archive ang “$title”';
  }

  @override
  String get shellRenameChat => 'Palitan ang pangalan ng chat';

  @override
  String get shellChatTitle => 'Pamagat ng chat';

  @override
  String shellUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hindi pa nababasa',
      one: '1 hindi pa nababasa',
    );
    return '$_temp0';
  }

  @override
  String get shellLoadingChats => 'Nilo-load ang mga chat';

  @override
  String get shellWorkspaceNoChats => 'Wala pang chat dito';

  @override
  String get shellWorkspaceNewChatsHint =>
      'Ang mga bagong chat ay napupunta sa workspace na ito. Hindi awtomatikong inililipat dito ang mga naunang chat; hanapin ang mga ito sa Lahat ng chat.';

  @override
  String get shellNewChatsHint => 'Lalabas dito ang mga bagong chat';

  @override
  String get shellEngineStarting => 'Nagsisimula ang engine';

  @override
  String get shellChatsAfterStarting => 'Lalabas ang iyong mga chat kapag nagsimula na ito';

  @override
  String get shellStartEngine => 'Simulan ang engine';

  @override
  String get shellEngineStatusHint => 'Tingnan ang katayuan sa “Engine”';

  @override
  String shellHostUnreachable(String name) {
    return 'Hindi maabot ang “$name”';
  }

  @override
  String shellHostReconnecting(String name) {
    return 'Muling kumokonekta sa “$name”…';
  }

  @override
  String get shellRetryNow => 'Subukan ngayon';

  @override
  String shellHostConnecting(String name) {
    return 'Kumokonekta sa “$name”…';
  }

  @override
  String get shellHostChatsAfterConnecting => 'Lalabas ang mga chat ng host na ito kapag nakakonekta na';

  @override
  String shellCurrentHostLabel(String name, String view) {
    return 'Kasalukuyang host: $name, $view. Lumipat ng host';
  }

  @override
  String get shellChatGone => 'Wala na ang chat na ito';

  @override
  String get shellAccentMist => 'Mist';

  @override
  String get shellAccentDaiqing => 'Teal';

  @override
  String get shellAccentDusk => 'Dusk';

  @override
  String get shellAccentTurquoise => 'Aqua';

  @override
  String get shellAccentAmber => 'Amber';

  @override
  String get shellAccentGraphite => 'Slate';

  @override
  String get shellHideTurnFooter => 'Footer ng turn';

  @override
  String get shellHideTokenCount => 'Bilang ng token';

  @override
  String get shellHideReasoning => 'Pag-iisip';

  @override
  String get shellHideActivityStrip => 'Activity strip';

  @override
  String get shellHideWhaleTail => 'Buntot ng balyena';

  @override
  String get shellHideTodoPill => 'To-do bar';

  @override
  String get shellHideGoalBar => 'Goal bar';

  @override
  String get shellToday => 'Ngayon';

  @override
  String get shellThisWeek => 'Ngayong linggo';

  @override
  String get shellEarlier => 'Mas maaga';

  @override
  String get shellSeatNative => 'Native';

  @override
  String get shellSeatIsland => 'Naka-embed na Web';

  @override
  String get shellSeatWeb => 'Buksan sa JDK Web';

  @override
  String get shellPlugins => 'Mga plugin';

  @override
  String get shellHeaderActions => 'Mga button ng header';

  @override
  String get shellAllHidden => 'Lahat ay nakatago';

  @override
  String shellSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count item', one: '1 item');
    return '$_temp0';
  }

  @override
  String get shellQuickActions => 'Mga mabilisang aksyon';

  @override
  String get shellSuggestionCards => 'Mga suggestion card';

  @override
  String shellSuggestionCardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count card', one: '1 card');
    return '$_temp0';
  }

  @override
  String get shellDrawerGroups => 'Mga grupo ng drawer';

  @override
  String get shellDrawerSort => 'Pagkakasunod-sunod ng drawer';

  @override
  String get shellDrawerFilter => 'Filter ng drawer';

  @override
  String get shellPending => 'Nakabinbin';

  @override
  String get shellAll => 'Lahat';

  @override
  String get shellDensity => 'Density';

  @override
  String get shellCompact => 'Siksik';

  @override
  String get shellSpacious => 'Maluwag';

  @override
  String get shellThemeMode => 'Mode ng hitsura';

  @override
  String get shellAccentColor => 'Accent color';

  @override
  String get shellPet => 'Pet';

  @override
  String get shellConfigured => 'Nakatakda';

  @override
  String get shellShortcuts => 'Mga keyboard shortcut';

  @override
  String get shellConfigFileTooLarge => 'Lampas 64 KiB ang file';

  @override
  String get shellConfigRootNotObject => 'Dapat object ang top level';

  @override
  String get shellConfigVersionMissing => 'Nawawala ang version';

  @override
  String get shellConfigVersionNotInt => 'Dapat integer ang version';

  @override
  String get shellConfigVersionTooLow => 'Nagsisimula sa 1 ang version';

  @override
  String shellConfigVersionTooHigh(int version) {
    return 'I-update ang app para magamit ang version $version';
  }

  @override
  String get shellConfigNotObject => 'Inaasahan ang isang object';

  @override
  String get shellConfigNotArray => 'Inaasahan ang isang array';

  @override
  String get shellConfigNotString => 'Inaasahan ang isang string';

  @override
  String get shellConfigNotBool => 'Inaasahan ang true o false';

  @override
  String get shellConfigEmpty => 'Hindi maaaring walang laman';

  @override
  String get shellConfigUnknownKey => 'Hindi kilalang key, binalewala';

  @override
  String get shellConfigDuplicateKey => 'Duplicate na key, ang huli lang ang nalalapat';

  @override
  String get shellConfigDuplicateItem => 'Duplicate, binalewala';

  @override
  String shellConfigMissing(String key) {
    return 'Nawawala ang $key';
  }

  @override
  String shellConfigTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lampas $count karakter, pinutol',
      one: 'Lampas 1 karakter, pinutol',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooLong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lampas $count karakter',
      one: 'Lampas 1 karakter',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hanggang $count item, binalewala ang sobra',
      one: 'Hanggang 1 item, binalewala ang sobra',
    );
    return '$_temp0';
  }

  @override
  String get shellConfigValueNoun => 'value';

  @override
  String shellConfigUnsupportedValue(String noun, String value) {
    return 'Hindi sinusuportahang $noun na “$value”';
  }

  @override
  String get shellConfigHeaderItem => 'Inaasahan ang button ID o object';

  @override
  String get shellConfigHeaderId =>
      'Maaaring gumamit ang mga ID ng mga letra, numero at -, na nagsisimula sa maliit na letra';

  @override
  String get shellConfigIdTaken => 'Duplicate na ID';

  @override
  String get shellConfigCommandSlash => 'Hindi kasama ang / sa mga pangalan ng command, inalis';

  @override
  String get shellConfigCommandName => 'Mga letra, numero at : . _ - lang ang magagamit sa mga pangalan ng command';

  @override
  String get shellConfigNoNewline => 'Hindi pinapayagan ang mga line break';

  @override
  String get shellConfigHttpsOnly => 'Mga HTTPS link lang ang sinusuportahan';

  @override
  String get shellConfigBadUrl => 'Di-wastong format ng link';

  @override
  String get shellConfigAccentFormat => 'Gamitin ang #RRGGBB para sa mga kulay';

  @override
  String get shellConfigAccentBoth => 'Pumili ng isa sa dito o accentPreset; ginamit ang accentPreset';

  @override
  String get shellConfigPetId => 'Maliliit na letra, numero at - lang ang magagamit sa mga ID';

  @override
  String get shellConfigKeysFormat => 'Di-wastong format, halimbawa ctrl+k';

  @override
  String get shellConfigSystemKey => 'Hindi pinapayagan ang mga system key';

  @override
  String get shellConfigNeedModifier => 'Isama ang ctrl o alt';

  @override
  String get shellConfigReservedKey => 'Ginagamit ng system o keyboard';

  @override
  String shellConfigDuplicateShortcut(String pointer) {
    return 'Kapareho ng $pointer';
  }

  @override
  String get shellConfigSlotName => 'Di-wastong format ng slot name';

  @override
  String get shellConfigUnknownSlot => 'Wala pa sa JDK ang slot na ito, itinabi para sa susunod';

  @override
  String get shellConfigUnseatableSlot => 'Hindi sinusuportahan dito ang mga plugin';

  @override
  String get shellConfigPackageName => 'Di-wastong format ng package name';

  @override
  String get shellConfigActionNoun => 'aksyon';

  @override
  String get shellConfigPageNoun => 'pahina';

  @override
  String get shellConfigButtonNoun => 'button';

  @override
  String get shellConfigIconNoun => 'icon';

  @override
  String get shellConfigNotTextFile => 'Hindi text file';

  @override
  String shellJsonPosition(int line, int column, String reason) {
    return 'Linya $line, column $column: $reason';
  }

  @override
  String get shellJsonEmptyFile => 'Walang laman ang file';

  @override
  String get shellJsonExtraContent => 'May sobrang nilalaman sa dulo';

  @override
  String get shellJsonIncompleteFile => 'Hindi kumpleto ang file';

  @override
  String get shellJsonCommentsUnsupported => 'Hindi sinusuportahan ang mga komento';

  @override
  String get shellJsonDoubleQuotes => 'Kailangan ng double quote ang mga string';

  @override
  String get shellJsonMissingValue => 'May nawawalang halaga rito';

  @override
  String shellJsonUnknownContent(String value) {
    return 'Hindi kilalang nilalaman na “$value”';
  }

  @override
  String get shellJsonTooDeep => 'Masyadong malalim ang nesting';

  @override
  String get shellJsonExtraComma => 'Sobrang kuwit';

  @override
  String get shellJsonQuotedKey => 'Kailangan ng double quote ang mga key';

  @override
  String get shellJsonExpectedKey => 'Inaasahan ang isang key dito';

  @override
  String get shellJsonMissingColon => 'May nawawalang colon pagkatapos ng key';

  @override
  String get shellJsonMissingComma => 'May nawawalang kuwit dito';

  @override
  String shellJsonUnexpectedContent(String value) {
    return 'Hindi inaasahang “$value” dito';
  }

  @override
  String get shellJsonUnterminatedString => 'Hindi tapos na string';

  @override
  String get shellJsonBadEscape => 'Di-wastong string escape';

  @override
  String get shellJsonStringNewline => 'Hindi maaaring maglaman ng literal na line break ang mga string';

  @override
  String get shellJsonControlCharacter => 'May control character ang string';

  @override
  String get shellJsonBadNumber => 'Di-wastong format ng numero';

  @override
  String shellSkillInstallPrompt(String skill) {
    return 'I-install ang JDK-Go interface skill na $skill sa host na ito:';
  }

  @override
  String shellSkillInstallDirectory(String skill) {
    return '1. Likhain ang target na folder `\$DSH_HOME/skills/$skill/` kung kinakailangan (o `~/.dsh/skills/$skill/` kung hindi nakatakda ang DSH_HOME).';
  }

  @override
  String get shellSkillInstallFiles =>
      '2. Isulat ang bawat file sa ibaba sa ibinigay na relatibong path nito, na pinapanatiling eksakto ang nilalaman ayon sa ibinigay.';

  @override
  String get shellSkillInstallConfirm => '4. Sabihin sa akin kapag na-install na.';

  @override
  String shellSkillInstallFile(String path) {
    return 'File `$path`:';
  }

  @override
  String get shellFromUiJson => 'Mula sa ui.json';

  @override
  String get shellViewSource => 'Tingnan ang source';

  @override
  String get shellSourcePosition => 'Lokasyon';

  @override
  String get shellRestoreDefaults => 'I-reset sa default';

  @override
  String get shellConfigNotApplied => 'Hindi nailapat';

  @override
  String shellConfigDroppedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count isyu ang hindi nailapat',
      one: '1 isyu ang hindi nailapat',
    );
    return '$_temp0';
  }

  @override
  String shellConfigAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nailapat ang $count item',
      one: 'Nailapat ang 1 item',
    );
    return '$_temp0';
  }

  @override
  String get shellInterfaceConfig => 'UI config';

  @override
  String get shellSkillNotInstalled => 'Hindi naka-install ang skill';

  @override
  String get shellInstallInterfaceSkill => 'I-install ang interface skill';

  @override
  String get shellInstallInterfaceSkillMessage =>
      'Kapag na-install na, maaaring ayusin ng AI ang interface ng app ayon sa hiling mo';

  @override
  String get shellNoUiJson => 'Walang ui.json';

  @override
  String get shellConfigUsingPrevious => 'Hindi nailapat, ginagamit pa rin ang nakaraang configuration';

  @override
  String get shellConfigDroppedHeading => 'Hindi nailapat';

  @override
  String get shellConfigNotesHeading => 'Mga babala';

  @override
  String get shellConfigAppliedHeading => 'Nailapat';

  @override
  String shellConfigValueOptions(String noun, String value, String options) {
    return 'Hindi sinusuportahang $noun na “$value”, mga opsyon: $options';
  }

  @override
  String get shellListSeparator => ',';

  @override
  String shellSkillInstallCheck(String command) {
    return '3. Patakbuhin ang $command pagkatapos isulat ang mga file. Kung tumakbo ito, kumpleto na ang pag-install (normal ang mensaheng hindi pa umiiral ang ui.json).';
  }

  @override
  String get shellSemanticsSeparator => ',';

  @override
  String shellChatsArchivedPartial(int count, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-archive ang $count chat',
      one: 'Na-archive ang 1 chat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failed,
      locale: localeName,
      other: 'hindi ma-archive ang $failed chat',
      one: 'hindi ma-archive ang 1 chat',
    );
    return '$_temp0; $_temp1';
  }

  @override
  String get shellPanelOverview => 'Impormasyon';

  @override
  String get shellPanelWorkspace => 'Workspace';

  @override
  String get shellPanelModel => 'Model';

  @override
  String get shellPanelHost => 'Host';

  @override
  String get shellPanelOpenFull => 'Buksan ang buong pahina';

  @override
  String get shellPanelNoPlugins => 'Wala pang plugin panel para sa chat na ito';

  @override
  String get shellQuickPanel => 'Mga shortcut';

  @override
  String shellQuickPanelHint(String path) {
    return 'Baguhin ang mga ito sa $path';
  }

  @override
  String starPromptTitle(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours oras na akong nakasama mo sa JDK-Go~',
      one: 'Isang oras na akong nakasama mo sa JDK-Go~',
      zero: 'Kalahating oras na akong nakasama mo sa JDK-Go~',
    );
    return '$_temp0';
  }

  @override
  String get starPromptBody =>
      'Libre at open source ang JDK-Go. Kung naging mas maganda ang paggamit mo ng iyong telepono dahil dito, mangyaring bigyan ito ng Star — napakalaking bagay nito para sa munting balyenang ito!';

  @override
  String get starPromptPlea => 'Pakiusap naman~ Mahalaga talaga ito!!';

  @override
  String get starPromptStar => 'I-Star sa GitHub';

  @override
  String get starPromptDone => 'Na-Star na';

  @override
  String get starPromptLater => 'Mamaya na lang';

  @override
  String get starSettingsTitle => 'I-Star ang JDK-Go sa GitHub';

  @override
  String get phoneStartupFailureStopping => 'Nabigo ang pagsisimula; humihinto';

  @override
  String phoneStartupFailureStoppingDetail(String reason) {
    return 'Nabigo ang pagsisimula; humihinto. $reason';
  }

  @override
  String get phoneStartupTokenTimeout =>
      'Nag-time out ang pagsisimula: walang dumating na startup token sa loob ng 180 segundo. Tingnan ang mga log.';

  @override
  String get phoneStartupPortNotReady =>
      'Dumating ang startup token, ngunit hindi naging handa ang port ng lokal na serbisyo. Tingnan ang mga log.';

  @override
  String get stateDiagnosticsSubject => 'Diagnostics bundle ng JDK-Go';

  @override
  String get stateStoragePermission => 'Walang pahintulot sa storage para mag-save sa Downloads';

  @override
  String get stateDiagnosticsStorageFull => 'Kulang ang storage para likhain ang diagnostics bundle';

  @override
  String get stateDiagnosticsExportFailed => 'Hindi ma-export ang diagnostics bundle';

  @override
  String get stateForumUnreachable => 'Hindi maabot ang forum';

  @override
  String get stateSignInExpired => 'Nag-expire ang sign-in. Mag-sign in muli.';

  @override
  String get stateForbidden => 'Tinanggihan ang pahintulot';

  @override
  String get stateForumContentMissing => 'Hindi nahanap o nabura ang nilalaman';

  @override
  String get stateTooManyActions => 'Masyadong maraming aksyon. Subukang muli mamaya.';

  @override
  String get stateForumSendFailed => 'Hindi naipadala';

  @override
  String get stateForumServerError => 'May problema ang forum';

  @override
  String get stateBrowserOpenFailed => 'Hindi mabuksan ang browser';

  @override
  String get stateSignInStartFailed => 'Hindi masimulan ang pag-sign in';

  @override
  String get stateSignInIncompleteRetry => 'Hindi natapos ang pag-sign in. Subukang muli.';

  @override
  String get statePluginLabel => 'Plugin';

  @override
  String get stateConfigLabel => 'Configuration';

  @override
  String get stateConfigShare => 'Nakabahaging configuration';

  @override
  String get stateShareCode => 'Share code';

  @override
  String get stateCopyShareCodeFirst => 'Kopyahin muna ang share code mula sa Ibahagi';

  @override
  String get stateFileOpenFailed => 'Hindi mabuksan ang file na ito';

  @override
  String get stateLinkOpenFailed => 'Hindi mabuksan ang link na ito';

  @override
  String get stateAlertPublicDone => 'Natapos ang isang turn';

  @override
  String get stateAlertPublicFailed => 'Nabigo ang isang turn';

  @override
  String get stateAlertPublicStopped => 'Huminto ang isang turn';

  @override
  String get stateAlertPublicApproval => 'May hakbang na nangangailangan ng iyong pag-apruba';

  @override
  String get stateAlertPublicQuestion => 'May tanong na nangangailangan ng iyong sagot';

  @override
  String get stateAlertTurnDone => 'Natapos ang turn na ito';

  @override
  String get stateAlertOutputLimit => 'Tapos na · Naabot ang limitasyon ng output';

  @override
  String get stateAlertTurnBlocked => 'Naharang ang turn na ito';

  @override
  String get stateAlertEngineRestarted => 'Naantala · Nag-restart ang engine';

  @override
  String get stateAlertMissingKey => 'Error · Walang nakatakdang API key';

  @override
  String get stateAlertTurnFailed => 'Nabigo ang turn na ito';

  @override
  String get stateRunCommand => 'Patakbuhin ang command';

  @override
  String get stateWriteFile => 'Isulat ang file';

  @override
  String get stateEditFile => 'I-edit ang file';

  @override
  String get stateOpenPage => 'Buksan ang web page';

  @override
  String get stateWebSearch => 'Paghahanap sa web';

  @override
  String get stateAlertQuestion => 'Isang tanong para sa iyo';

  @override
  String get stateSizeSmall => 'Maliit';

  @override
  String get stateSizeStandard => 'Standard';

  @override
  String get stateSizeLarge => 'Malaki';

  @override
  String get statePetDone => 'Tapos na';

  @override
  String get statePetFailed => 'Nagkaproblema';

  @override
  String get statePhoneNotReady => 'Hindi pa handa ang phone control';

  @override
  String get stateBackgroundRestricted => 'Pinaghihigpitan ang background network access';

  @override
  String get stateBackgroundFinish => 'Hayaang matapos ang mga chat sa background';

  @override
  String get stateDeepSeekAccount => 'DeepSeek account';

  @override
  String get stateAccountUnreachable => 'Hindi maabot ang DeepSeek';

  @override
  String get stateAccountUnavailable => 'Hindi available ang DeepSeek sign-in';

  @override
  String get stateSignInIncomplete => 'Hindi natapos ang pag-sign in';

  @override
  String get stateSignInTimeout => 'Nag-time out ang pag-sign in';

  @override
  String get stateSignInSaveFailed => 'Hindi ma-save ang mga detalye ng sign-in';

  @override
  String get stateEngineNotReady => 'Hindi pa handa ang engine';

  @override
  String get stateSignInInterrupted => 'Naantala ang pag-sign in';

  @override
  String get stateAccountUnsupported => 'Hindi sinusuportahan ng engine na ito ang pag-sign in sa account';

  @override
  String get stateCheckPhoneNetwork => 'Suriin ang network ng telepono mo at subukang muli';

  @override
  String get stateServiceUnavailableRetry => 'Hindi available ang serbisyo. Subukang muli mamaya.';

  @override
  String get stateAuthorizationFailed => 'Nabigo ang awtorisasyon. Mag-sign in muli.';

  @override
  String get stateAuthorizationExpired => 'Nag-expire ang pahina ng awtorisasyon. Mag-sign in muli.';

  @override
  String get stateRestartEngineRetry => 'I-restart mula sa Engine, saka subukang muli';

  @override
  String get stateEngineStartingRetry => 'Nagsisimula ang engine. Subukang muli mamaya.';

  @override
  String get stateEngineDisconnectedSignIn => 'Na-disconnect ang engine. Mag-sign in muli.';

  @override
  String get stateUpdateRuntimeOrKey => 'I-update ang runtime o gumamit ng API key';

  @override
  String get stateEngineDisconnected => 'Na-disconnect ang engine';

  @override
  String get stateAgentError => 'Error';

  @override
  String get stateNotRunning => 'Hindi tumatakbo';

  @override
  String get stateAgentOneShot => 'One-shot';

  @override
  String get stateAgentContinuable => 'Maaaring ipagpatuloy';

  @override
  String get stateAgentExternal => 'Panlabas na gawain';

  @override
  String get stateSubagent => 'Subagent';

  @override
  String get stateParentChat => 'Parent chat';

  @override
  String get statePreparing => 'Inihahanda';

  @override
  String get stateIconMist => 'Mist blue';

  @override
  String get stateIconNight => 'Nightfall';

  @override
  String get stateIconFrost => 'Frost white';

  @override
  String get stateIconInk => 'Ink';

  @override
  String get stateAppDisclaimer => 'Binuo sa DeepSeek Harness · Hindi opisyal na DeepSeek app';

  @override
  String get stateWallpaper => 'Wallpaper';

  @override
  String get stateFileMissing => 'Hindi nahanap ang file. Maaaring nabura o nailipat ito.';

  @override
  String get stateFileNoApp => 'Walang app sa telepono na ito na makakapagbukas sa uri ng file na ito';

  @override
  String get stateFileConnectionLimit => 'Masyadong malaki ang file para sa koneksyong ito';

  @override
  String get stateFileReadUnsupported => 'Hindi makabasa ng mga file ang koneksyong ito';

  @override
  String get stateArtifactImage => 'Larawan';

  @override
  String get stateArtifactDocument => 'Dokumento';

  @override
  String get stateArtifactSheet => 'Spreadsheet';

  @override
  String get stateArtifactSlides => 'Presentasyon';

  @override
  String get stateArtifactArchive => 'Archive';

  @override
  String get stateArtifactAudio => 'Audio';

  @override
  String get stateArtifactVideo => 'Video';

  @override
  String get stateArtifactWeb => 'Web page';

  @override
  String get stateArtifactText => 'Teksto';

  @override
  String get stateArtifactFile => 'File';

  @override
  String get statePrivateKeyTooLarge => 'Masyadong malaki ang file para maging private key';

  @override
  String get stateBotTeamBusy => 'May ibang JDK na gumagamit ng team na ito';

  @override
  String get stateBotOperationFailed => 'Hindi natapos. Subukang muli.';

  @override
  String get stateBotMissing => 'Walang DS Bot ang host na ito';

  @override
  String get stateHostAuthFailed => 'Nabigo ang authentication ng host';

  @override
  String get stateUnexpectedError => 'Nagkaproblema';

  @override
  String get stateGroupChat => 'Group chat';

  @override
  String get stateBotNewMessage => 'Bagong mensahe ng bot';

  @override
  String get stateChatAgentBusy => 'Abala ang AI. Subukang muli mamaya.';

  @override
  String get stateChatWriterHeld => 'Ginagamit sa ibang lugar ang chat na ito';

  @override
  String get stateChatModelUnavailable => 'Hindi available ang model na ito';

  @override
  String get stateChatAttachmentInvalid => 'Hindi maipadala ang attachment na ito';

  @override
  String get stateChatForkUnavailable => 'Hindi makapag-branch dito';

  @override
  String get stateChatImagesTooLarge => 'Masyadong malalaki ang mga larawan. Magpadala ng mas kaunti nang sabay-sabay.';

  @override
  String get stateChatSyncInterrupted => 'Naantala ang chat sync';

  @override
  String get stateChatSynchronizing => 'Sini-sync ang chat';

  @override
  String get stateChatSyncRetry => 'I-sync muli';

  @override
  String get stateChatSyncRequired => 'Hindi pa naka-sync ang chat. I-sync muli at subukang muli.';

  @override
  String get stateChatAutoApproveFailed => 'Hindi mapayagan nang awtomatiko';

  @override
  String get stateCommandMissing => 'Hindi nahanap ang command';

  @override
  String get stateCommandFailed => 'Hindi tumakbo ang command';

  @override
  String get stateChatStopSteered => 'Hindi maihinto ang turn na ito. Ipinadala bilang gabay.';

  @override
  String get stateChatTextOnlyModel =>
      'Ipinadala bilang mga file: hindi inililista ng model na ito ang image input. Lumipat ng model o itakda ang Input nito sa Teksto + larawan.';

  @override
  String get stateAttachmentUploadFailed => 'Hindi ma-upload ang attachment';

  @override
  String get stateChatImageModelRequired =>
      'Hindi inililista ng model na ito ang image input. Lumipat ng model o itakda ang Input nito sa Teksto + larawan at ipadala muli.';

  @override
  String get stateSendFailed => 'Hindi naipadala';

  @override
  String get stateChatStopFailed => 'Hindi mahinto. Subukang muli.';

  @override
  String get stateChatTurnEnded => 'Tapos na ang turn na ito. Magsisimula ng bagong turn ang mensahe mo.';

  @override
  String get stateChatSteerFailed => 'Hindi magabayan';

  @override
  String get stateChatUndoTooLate => 'Huli na. Nabasa na ng AI ang mensaheng ito.';

  @override
  String get stateChatUndoFailed => 'Hindi ma-undo';

  @override
  String get stateChatApprovalFailed => 'Hindi maisumite ang pag-apruba';

  @override
  String get stateChatAnswerFailed => 'Hindi maisumite ang sagot';

  @override
  String get stateChatModelSwitchFailed => 'Hindi makapagpalit ng model';

  @override
  String get stateChatHistoryFailed => 'Hindi ma-load ang kasaysayan';

  @override
  String get stateChatBranchLastReply => 'Mag-branch mula sa huling sagot ng natapos na turn';

  @override
  String get stateChatBranchFailed => 'Hindi makapag-branch';

  @override
  String get stateChatEarlierHistoryFailed => 'Hindi ma-load ang mga naunang kasaysayan';

  @override
  String get stateChatNoEarlierHistory => 'Walang kasaysayan bago ang mensaheng ito. Magsimula ng bagong chat.';

  @override
  String get stateCommandNewDescription => 'Magsimula ng bagong chat';

  @override
  String get stateModelLabel => 'Model';

  @override
  String get stateCommandModelDescription => 'Palitan ang model at lalim ng pag-iisip';

  @override
  String get stateCommandExportLabel => 'I-export ang mga log';

  @override
  String get stateCommandExportDescription =>
      'I-export ang buong kasaysayan ng chat na ito bilang ZIP para ibahagi o i-save sa Downloads';

  @override
  String get stateAllFeatures => 'Lahat ng feature';

  @override
  String get stateCommandFeaturesDescription => 'I-access ang bawat feature sa JDK Web';

  @override
  String get stateCompactLabel => 'Compact';

  @override
  String get stateCommandCompactDescription => 'I-compact ang chat sa itaas para magbakante ng context';

  @override
  String get statePermissionLabel => 'Pahintulot';

  @override
  String get stateCommandPermissionDescription => 'Palitan ang permission preset (sandbox mode + approval policy)';

  @override
  String get stateCommandPermissionHint => '<pangalan ng preset>';

  @override
  String get statePlanLabel => 'Plano';

  @override
  String get stateCommandPlanDescription => 'Pumasok o lumabas sa Plan mode';

  @override
  String get stateGoalLabel => 'Layunin';

  @override
  String get stateCommandGoalDescription => 'Magtakda o tumingin ng layunin para sa matagal na gawain';

  @override
  String get stateFeedbackLabel => 'Feedback';

  @override
  String get stateCommandFeedbackDescription => 'Magpadala ng feedback tungkol sa chat na ito';

  @override
  String get stateCommandFeedbackHint => '<mensahe>';

  @override
  String get stateShareFileTooLarge => 'Masyadong malaki ang isang file at hindi naidagdag';

  @override
  String get stateShareFileUnreadable => 'Hindi mabasa ang isang file';

  @override
  String get stateShareImagesOnly => 'Mga larawan lang ang maipapadala ng host na ito';

  @override
  String get stateComposerInserted => 'Naidagdag sa composer';

  @override
  String get stateCordisPending => 'Nakabinbin';

  @override
  String get stateCordisStarting => 'Nagsisimula';

  @override
  String get stateCordisRunFailed => 'Nabigo ang takbo';

  @override
  String get stateCordisNoApproval => 'Hindi naipagkaloob ang pahintulot sa pagtakbo';

  @override
  String get stateCordisBackendFailed => 'Hindi masimulan ang background component';

  @override
  String get stateCordisClientLoadFailed => 'Hindi ma-load ang interface';

  @override
  String get stateCordisRenderFailed => 'Hindi maipakita ang interface';

  @override
  String get stateCordisFailed => 'Hindi mapatakbo';

  @override
  String get stateDrawerAll => 'Lahat';

  @override
  String get stateDrawerUnread => 'Hindi pa nababasa';

  @override
  String get stateDrawerToday => 'Ngayon';

  @override
  String get stateDrawerThisWeek => 'Ngayong linggo';

  @override
  String get stateDrawerEarlier => 'Mas maaga';

  @override
  String get stateEngineAuthFailed => 'Nabigo ang authentication ng engine';

  @override
  String get stateChatMissing => 'Wala na ang chat na ito';

  @override
  String get stateEngineUnsupported => 'Hindi sinusuportahan ng bersyong ito ng engine';

  @override
  String get stateEngineServiceUnavailable =>
      'Hindi pa handa ang kinakailangang serbisyo ng engine. Suriin ang mga log ng engine o i-export ang diagnostics.';

  @override
  String get stateEngineOperationUnavailable =>
      'Hindi mapatakbo ng engine ang operasyong ito ngayon. Suriin ang mga log ng engine.';

  @override
  String get stateSettingsRefreshed => 'Nagbago sa ibang lugar. Na-refresh.';

  @override
  String get stateCredentialFromEnvironment => 'Galing sa environment ng engine ang key na ito at hindi mababago rito';

  @override
  String get stateSettingsFromFile => 'Itinakda ng configuration file';

  @override
  String get stateSettingsInteger => 'Maglagay ng buong numero';

  @override
  String get stateSettingsInvalidFormat => 'Di-wastong format';

  @override
  String get stateSettingsReadOnly => 'Read-only ang mga setting ng engine';

  @override
  String get statePluginDisabled => 'Naka-disable ang plugin';

  @override
  String get stateSettingsRestartRequired => 'I-restart ang engine para baguhin ito';

  @override
  String get stateSettingsInvalidValue => 'Di-wastong halaga';

  @override
  String get stateSettingsRejected => 'Hindi tinanggap ng engine ang halagang ito';

  @override
  String get stateInventoryEnabled => 'Naka-enable';

  @override
  String get stateInventoryDisabled => 'Naka-disable';

  @override
  String get stateLoading => 'Nilo-load';

  @override
  String get stateInventoryWaiting => 'Naghihintay sa mga dependency';

  @override
  String get stateInventoryConditional => 'Conditional';

  @override
  String get stateBundleBuiltIn => 'Built-in sa JDK';

  @override
  String get stateBundleHeadless => 'Headless';

  @override
  String get stateConfigFile => 'Configuration file';

  @override
  String get stateGoalEmpty => 'Hindi maaaring walang laman ang layunin';

  @override
  String get stateGoalPauseFailed => 'Hindi ma-pause';

  @override
  String get stateGoalResumeFailed => 'Hindi maituloy';

  @override
  String get stateGoalClearOffline => 'Hindi ma-clear: Hindi maabot ang engine';

  @override
  String get stateGoalClearFailed => 'Hindi ma-clear';

  @override
  String get stateGoalStale => 'Nagbago ang layunin. Subukang muli.';

  @override
  String get stateGoalMissing => 'Wala na ang layunin';

  @override
  String get stateGoalChatNotReady => 'Hindi pa handa ang chat. Subukang muli mamaya.';

  @override
  String get stateGoalTurnsExhausted => 'Wala nang natitirang turn';

  @override
  String get stateGoalStateChanged => 'Nagbago ang katayuan ng layunin';

  @override
  String get stateSshHost => 'SSH host';

  @override
  String get stateHostBrowserFailed =>
      'Hindi mabuksan ang browser. Kopyahin ang sign-in link at buksan ito sa browser.';

  @override
  String get stateSignInFailed => 'Hindi makapag-sign in';

  @override
  String get stateMarketTooLarge => 'Masyadong malaki ang katalogo ng plugin. Huminto ang pag-download.';

  @override
  String get stateMarketUnreachable => 'Hindi maabot ang katalogo ng plugin';

  @override
  String get stateMarketInsecure => 'Hindi makakonekta nang secure sa katalogo ng plugin';

  @override
  String get stateMarketTimeout => 'Nag-time out ang katalogo ng plugin';

  @override
  String get stateMarketInterrupted => 'Naputol ang pag-download ng katalogo ng plugin';

  @override
  String get stateRegistryDefault => 'Default na registry';

  @override
  String get stateRegistryNpm => 'Opisyal na npm registry';

  @override
  String get stateRegistryMirror => 'npmmirror mirror';

  @override
  String get statePluginIncompatible => 'Hindi sinusuportahan ng plugin na ito ang kasalukuyang bersyon ng JDK.';

  @override
  String get statePluginInstallCancelled => 'Kinansela ang pag-install';

  @override
  String get statePluginNoChanges => 'Walang binago';

  @override
  String get statePluginIncompatibleTitle => 'Hindi tugma sa JDK na ito';

  @override
  String get statePluginNetworkFailed => 'Hindi makakonekta';

  @override
  String get statePluginSourceUnreachable => 'Hindi maabot ang source website ng plugin';

  @override
  String get statePluginDownloadTimeout => 'Nag-time out ang pag-download';

  @override
  String get statePluginRegistryUnavailable => 'Hindi tumutugon ang registry';

  @override
  String get statePluginPnpmMissing => 'Nawawala ang pnpm';

  @override
  String get statePluginPhonePnpmMissing => 'Nawawala ang pnpm sa telepono na ito';

  @override
  String get statePluginHostPnpmMissing => 'Nawawala ang pnpm sa host na ito';

  @override
  String get statePluginNotFound => 'Hindi nahanap ang plugin';

  @override
  String get statePluginPackageMissing => 'Hindi nahanap ang package sa registry';

  @override
  String get statePluginTooNew => 'Masyadong bago ang bersyon';

  @override
  String get statePluginWaitForRelease => 'Available na i-install 24 oras pagkatapos ng release';

  @override
  String get statePluginVersionMissing => 'Hindi nahanap ang bersyon';

  @override
  String get statePluginRegistryVersionMissing => 'Wala pa sa registry ang bersyong ito';

  @override
  String get stateDeviceStorageFull => 'Kulang ang storage ng device';

  @override
  String get statePluginNoWritePermission => 'Walang pahintulot sa pagsulat';

  @override
  String get statePluginConfigReadOnly => 'Hindi masusulatan ang configuration directory ng engine';

  @override
  String get statePluginIntegrityFailed => 'Nabigo ang pag-verify ng file';

  @override
  String get statePluginDownloadIncomplete => 'Hindi kumpleto ang na-download na file';

  @override
  String get statePluginBuildScripts => 'Kailangan ng mga build script';

  @override
  String get statePluginBuildApproval => 'Kailangan ng pag-apruba ang mga build script';

  @override
  String get statePluginAlreadyInstalled => 'Naka-install na';

  @override
  String get statePluginUninstallFirst => 'I-uninstall bago lumipat ng bersyon';

  @override
  String get statePluginInvalid => 'Hindi isang JDK plugin';

  @override
  String get statePluginNoEntry => 'Walang plugin entry ang package na ito. Ibinalik ang pag-install.';

  @override
  String get statePluginInUse => 'Ginagamit ang plugin';

  @override
  String get statePluginHasDependents => 'Umaasa rito ang ibang mga plugin';

  @override
  String get statePluginManagedElsewhere => 'Hindi mababago ito rito';

  @override
  String get statePluginEngineManaged => 'Pinamamahalaan ng engine ang plugin na ito';

  @override
  String get statePluginAuthorizationExpired => 'Nag-expire ang awtorisasyon';

  @override
  String get statePluginBuildChanged => 'Nagbago ang mga build script. I-install muli ang plugin.';

  @override
  String get statePluginInvalidAddress => 'Di-wastong installation URL';

  @override
  String get statePluginCatalogInvalidAddress => 'Di-wasto ang installation URL ng katalogo';

  @override
  String get statePluginOperationIncomplete => 'Hindi natapos ang operasyon';

  @override
  String get statePluginRemoteForbidden => 'Hindi pinapayagan ng host na ito ang remote installation';

  @override
  String get statePluginRelayToggleOnly => 'Pag-on o pag-off lang ng mga plugin ang magagawa ng mga relay connection';

  @override
  String get statePluginManagementUnsupported => 'Hindi sinusuportahan ng host ang pamamahala ng plugin';

  @override
  String get statePluginEngineUnsupported => 'Hindi sinusuportahan ng engine na ito ang pamamahala ng plugin';

  @override
  String get statePluginResultMissing => 'Hindi makuha ang resulta ng pag-install';

  @override
  String get statePluginResultPending => 'Nakabinbin ang resulta ng pag-install';

  @override
  String get statePluginDisconnected => 'Naka-disconnect';

  @override
  String get statePluginQueued => 'Nakapila';

  @override
  String get statePluginRemoving => 'Ina-uninstall ang lumang bersyon';

  @override
  String get statePluginInstalling => 'Dina-download at ini-install';

  @override
  String get statePluginApplying => 'Ina-enable';

  @override
  String get statePluginCancelling => 'Kinakansela';

  @override
  String get statePluginInstalledRestart => 'Na-install. I-restart para mailapat.';

  @override
  String get statePluginInstallFailed => 'Hindi ma-install';

  @override
  String get statePluginConnectFirst => 'Kumonekta para mag-install ng mga plugin';

  @override
  String get stateProviderOpenAi => 'OpenAI compatible';

  @override
  String get stateProviderAnthropic => 'Anthropic compatible';

  @override
  String get stateProviderUrlRequired => 'Maglagay ng Base URL';

  @override
  String get stateProviderUrlInvalid => 'Maglagay ng buong URL na nagsisimula sa http:// o https://';

  @override
  String get stateProviderUrlSuffix => 'Alisin ang bahagi pagkatapos ng ? o #';

  @override
  String get stateProviderKeyRequired => 'Maglagay ng API key';

  @override
  String get stateProviderKeyOnly => 'I-paste lang ang key, nang walang pangalan ng variable';

  @override
  String get stateProviderKeyQuotes => 'Alisin ang mga nakapaligid na panipi';

  @override
  String get stateProviderKeyInvalid => 'May di-wastong karakter ang key';

  @override
  String get stateProviderModelRequired => 'Maglagay ng model ID';

  @override
  String get stateProviderModelSpaces => 'Hindi maaaring maglaman ng espasyo ang model ID';

  @override
  String get stateProviderAlreadyAdded => 'Naidagdag na';

  @override
  String get stateProviderConflict => 'Nagbago ang provider. Bumalik at subukang muli.';

  @override
  String get stateProviderUnsupported => 'Hindi sinusuportahan ng bersyong ito ng engine ang aksyong ito';

  @override
  String get stateProviderKeyRejected => 'Di-wasto ang API key o walang pahintulot';

  @override
  String get stateProviderModelsMissing => 'Hindi nahanap ang listahan ng model. Suriin ang Base URL.';

  @override
  String get stateProviderRateLimited => 'Masyadong maraming request. Subukang muli mamaya.';

  @override
  String get stateProviderResponseTooLarge => 'Masyadong malaki ang tugon';

  @override
  String get stateProviderUnreachable => 'Hindi maabot ang address na ito. Suriin ang Base URL at network.';

  @override
  String get stateProviderModelsUnreadable => 'Hindi mabasa ang listahan ng model. Suriin ang Base URL.';

  @override
  String get stateProviderManualModels =>
      'Hindi makapaglista ng mga model ang protocol na ito. Idagdag ang mga ito nang manu-mano.';

  @override
  String get stateProviderConfigRejected =>
      'Tinanggihan ng engine ang configuration na ito. Suriin ang protocol at model.';

  @override
  String get stateProviderOffline => 'Hindi maabot ang engine';

  @override
  String get stateSafeStartupFailed => 'Nabigong magsimula';

  @override
  String get stateSafeCrashedEarly => 'Nag-crash pagkatapos magsimula';

  @override
  String get stateSafeCrashedLate => 'Nag-crash habang tumatakbo';

  @override
  String get stateSafeKilled => 'Itinigil ng system';

  @override
  String get stateSafeManualEntry => 'Pumasok ako sa Safe mode nang manu-mano';

  @override
  String get stateScheduleNotCreated => 'Natapos ang chat nang hindi nalilikha ang automation';

  @override
  String get stateScheduleChatFailed => 'Nabigo ang chat';

  @override
  String get stateScheduleResultPending => 'Naghihintay pa rin ng resulta';

  @override
  String get statePlanPending => 'Pagsusuri ng plano';

  @override
  String get stateQuestionPending => 'Kailangan ng sagot';

  @override
  String get stateExportRelayUnsupported => 'Hindi pa available ang export sa Relay';

  @override
  String get stateExportChatMissing => 'Hindi nahanap ang chat';

  @override
  String get stateExportFailed => 'Hindi ma-export';

  @override
  String get stateSizeExtraLarge => 'Napakalaki';

  @override
  String get stateSubscriptionUnsupported => 'Hindi sinusuportahan ng engine na ito ang subscription sign-in';

  @override
  String get stateSubscriptionUnreachable =>
      'Hindi maabot ang serbisyo ng sign-in. Suriin ang network mo at subukang muli.';

  @override
  String get stateSubscriptionSignInFailed => 'Hindi natapos ang pag-sign in. Subukang muli.';

  @override
  String get stateSubscriptionTimeout => 'Nag-time out ang request. Suriin ang network mo at subukang muli.';

  @override
  String get stateSubscriptionDisconnected => 'Na-disconnect ang engine. Subukang muli mamaya.';

  @override
  String get stateTerminalLimit => 'Naabot ang limitasyon ng terminal';

  @override
  String get stateTerminalStartFailed => 'Hindi masimulan ang terminal';

  @override
  String get stateTerminalDisabledOnHost =>
      'Pinatay ng computer na ito ang remote terminal. I-on ang “Terminal” sa Remote settings sa computer, saka subukang muli.';

  @override
  String get stateTileDuotone => 'Duotone';

  @override
  String get stateTileGeometric => 'Geometric';

  @override
  String get stateTileGlassy => 'Glass';

  @override
  String get stateUiNative => 'Native';

  @override
  String get stateDefaultWorkspace => 'Default na workspace';

  @override
  String stateDiagnosticsSaved(String where) {
    return 'Na-save sa $where';
  }

  @override
  String get stateDownloadsPrefix => 'Downloads/';

  @override
  String stateSharePluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugin', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String stateShareSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count skill', one: '1 skill');
    return '$_temp0';
  }

  @override
  String stateShareSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count grupo ng mga setting',
      one: '1 grupo ng mga setting',
    );
    return '$_temp0';
  }

  @override
  String stateAlertCompletedReply(String reply) {
    return 'Tapos na · $reply';
  }

  @override
  String stateAlertErrorDetail(String detail) {
    return 'Error · $detail';
  }

  @override
  String stateAlertUseTool(String name) {
    return 'Gamitin ang tool na $name';
  }

  @override
  String stateAlertApprovalAction(String action) {
    return 'Kailangan ng pag-apruba: $action';
  }

  @override
  String stateAlertApprovalReason(String action, String reason) {
    return 'Kailangan ng pag-apruba: $action · $reason';
  }

  @override
  String stateAlertQuestions(String question, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tanong para sa iyo: $question ($count sa kabuuan)',
      one: 'Tanong para sa iyo: $question (1 sa kabuuan)',
    );
    return '$_temp0';
  }

  @override
  String stateAlertQuestionText(String question) {
    return 'Tanong para sa iyo: $question';
  }

  @override
  String statePetChatsDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chat ang natapos',
      one: '1 chat ang natapos',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chat ang nabigo',
      one: '1 chat ang nabigo',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsApproval(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chat ang nangangailangan ng pag-apruba',
      one: '1 chat ang nangangailangan ng pag-apruba',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chat ang nangangailangan ng iyong sagot',
      one: '1 chat ang nangangailangan ng iyong sagot',
    );
    return '$_temp0';
  }

  @override
  String stateAttachmentEmpty(String name) {
    return 'Walang laman ang “$name”';
  }

  @override
  String stateAttachmentImageLimit(String name) {
    return 'Lampas 20 MB ang larawang “$name”';
  }

  @override
  String stateAttachmentFileLimit(String name) {
    return 'Lampas 200 MB ang file na “$name”';
  }

  @override
  String get stateAttachmentTotalLimit => 'Lampas 400 MB sa kabuuan ang mga attachment';

  @override
  String stateBotFinished(String name) {
    return 'Natapos magtrabaho si $name';
  }

  @override
  String stateBotQuestion(String name, String text) {
    return 'Nagtatanong si $name: $text';
  }

  @override
  String stateBotApproval(String name, String text) {
    return 'Kailangan ni $name ng pag-apruba: $text';
  }

  @override
  String get stateCommandPlanHint => '[off | request]';

  @override
  String get stateCommandGoalHint => '[goal | clear | pause | resume]';

  @override
  String stateShareReadFailed(String name) {
    return 'Hindi mabasa ang “$name”';
  }

  @override
  String stateShareAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hanggang $count attachment bawat mensahe',
      one: 'Hanggang 1 attachment bawat mensahe',
    );
    return '$_temp0';
  }

  @override
  String stateShareNamedFileTooLarge(String name) {
    return 'Masyadong malaki ang “$name” at hindi naidagdag';
  }

  @override
  String stateShareTextTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Masyadong mahaba ang teksto. Pinanatili ang unang $count karakter.',
      one: 'Masyadong mahaba ang teksto. Pinanatili ang unang karakter.',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMinimum(String bound) {
    return 'Dapat hindi bababa sa $bound';
  }

  @override
  String stateSettingsMaximum(String bound) {
    return 'Dapat hindi hihigit sa $bound';
  }

  @override
  String stateSettingsMultiple(String bound) {
    return 'Dapat multiple ng $bound';
  }

  @override
  String stateSettingsMinLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hindi bababa sa $count karakter',
      one: 'Hindi bababa sa 1 karakter',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMaxLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hindi hihigit sa $count karakter',
      one: 'Hindi hihigit sa 1 karakter',
    );
    return '$_temp0';
  }

  @override
  String stateEngineHttpRejected(int status) {
    return 'Tinanggihan ng engine ang request ($status)';
  }

  @override
  String stateGoalActionOffline(String action) {
    return '$action: Hindi maabot ang engine';
  }

  @override
  String stateHostRemoteLabel(String name) {
    return '$name · Remote';
  }

  @override
  String stateMarketHttpError(int status) {
    return 'Hindi mabuksan ang katalogo ng plugin (HTTP $status)';
  }

  @override
  String statePluginRuntimeIncompatible(String version) {
    return 'Hindi sinusuportahan ng plugin na ito ang kasalukuyang bersyon ng JDK ($version).';
  }

  @override
  String statePluginRequiredVersion(String wanted, String current) {
    return 'Nangangailangan ang plugin na ito ng JDK $wanted. Kasalukuyang bersyon: $current.';
  }

  @override
  String get statePluginRegistryUnreachable => 'Hindi maabot ang registry';

  @override
  String statePluginNamedRegistryUnreachable(String registry) {
    return 'Hindi maabot ang registry ($registry)';
  }

  @override
  String statePluginBuildsPending(String builds) {
    return 'Kailangan ng pag-apruba: $builds';
  }

  @override
  String statePluginRegistryProgress(String registry, int attempt, int attempts) {
    return 'Dina-download mula sa $registry (registry $attempt/$attempts)';
  }

  @override
  String stateProviderServiceUnavailable(int status) {
    return 'Hindi available ang serbisyo ($status)';
  }

  @override
  String stateProviderServiceStatus(int status) {
    return 'Nagbalik ang serbisyo ng $status';
  }

  @override
  String stateProviderKeySaveFailed(String reason) {
    return 'Na-save ang provider, ngunit hindi ang key: $reason';
  }

  @override
  String stateSafeSuspectPlugins(String what, String plugins) {
    return '$what, mga pinaghihinalaang plugin: $plugins';
  }

  @override
  String stateSafePreflightFailed(String what, String checks) {
    return '$what, nabigo ang mga startup check: $checks';
  }

  @override
  String get stateListSeparator => ',';

  @override
  String stateSafeRepairPrompt(String what) {
    return 'May problema ang aking JDK sa normal mode ($what). Sundin ang mga tagubilin ng Safe mode para hanapin ang sanhi. Ayusin ang web configuration gamit ang mga mababawing pagbabago, i-verify ang startup gamit ang dsh-app-plugins trial, saka sabihin sa akin kung ano ang nabago.';
  }

  @override
  String stateScheduleCreatePrompt(String title, String rule, String args) {
    return 'Lumikha ng automation na “$title”: $rule.\nTawagin ang schedule_create nang eksaktong isang beses, gamit ang mga argumentong ito nang walang pagbabago. Huwag patakbuhin ang gawain ngayon.\n\n```json\n$args\n```';
  }

  @override
  String stateActionReason(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String stateAlertPreviewRun(String value) {
    return 'Takbo: $value';
  }

  @override
  String stateAlertPreviewWrite(String value) {
    return 'Sulat: $value';
  }

  @override
  String stateAlertPreviewEdit(String value) {
    return 'Edit: $value';
  }

  @override
  String stateAlertPreviewOpen(String value) {
    return 'Buksan: $value';
  }

  @override
  String stateAlertPreviewUse(String value) {
    return 'Gamitin ang tool: $value';
  }

  @override
  String get stateUiWeb => 'Web';

  @override
  String statePluginRegistryProgressUnknown(String registry, int attempt) {
    return 'Dina-download mula sa $registry (registry $attempt/null)';
  }

  @override
  String get stateProviderTokenCountInvalid => 'Maglagay ng numero, tulad ng 128K';

  @override
  String get appSlogan => 'Kahit kailan, kahit saan. Go lang!';

  @override
  String get updateCheck => 'Tingnan kung may update';

  @override
  String get updateAutoCheck => 'Awtomatikong suriin';

  @override
  String get updateAutoCheckDaily => 'Minsan sa isang araw';

  @override
  String get updateTileDownloading => 'Dina-download';

  @override
  String updateTileDownloadingPercent(int percent) {
    return 'Dina-download $percent%';
  }

  @override
  String get updateTileVerifying => 'Bine-verify';

  @override
  String get updateTileReady => 'Handa nang i-install';

  @override
  String get updateTileInstalling => 'Ini-install';

  @override
  String updateTileSkipped(String version) {
    return 'Nilaktawan ang $version';
  }

  @override
  String updateTileNewVersion(String version) {
    return 'Bago: $version';
  }

  @override
  String get updateTileUpToDate => 'Napapanahon na';

  @override
  String get updateTileUnavailable => 'Hindi makapagsuri ngayon';

  @override
  String get updateUpToDate => 'Napapanahon ka na';

  @override
  String get updateCheckUnavailable => 'Hindi makapagsuri ng mga update ngayon. Subukang muli mamaya.';

  @override
  String get updateDownloadInterrupted => 'Naputol ang pag-download';

  @override
  String get updateDownloadInterruptedMessage =>
      'Naka-disconnect o masyadong mabagal ang network. Subukang muli para ituloy.';

  @override
  String get updateDownloadUnavailable => 'Hindi available ang link sa pag-download';

  @override
  String get updateDownloadUnavailableMessage => 'Subukang muli mamaya, o mag-download mula sa pahina ng release.';

  @override
  String get updateChecksumFailed => 'Nabigo ang pag-verify ng package';

  @override
  String get updateChecksumFailedMessage => 'Hindi tugma ang file sa release at nabura ito. Subukang muli.';

  @override
  String get updateChecksumMissing => 'Nawawala ang impormasyon sa pag-verify';

  @override
  String get updateChecksumMissingMessage =>
      'Para sa kaligtasan, mag-download mula sa pahina ng release para mag-install.';

  @override
  String get updateStorageWriteFailed => 'Hindi ma-save ang package';

  @override
  String get updateStorageWriteFailedMessage => 'Maaaring puno ang storage. Magbakante ng espasyo at subukang muli.';

  @override
  String get updateFreeSpaceRetry => 'Magbakante ng espasyo at subukang muli.';

  @override
  String updateSpaceRequired(String size) {
    return 'Kailangan ng humigit-kumulang $size na libreng espasyo. Magbakante ng espasyo at subukang muli.';
  }

  @override
  String get updateSettingsOpenFailed => 'Hindi mabuksan ang system settings';

  @override
  String get updateSettingsOpenFailedMessage =>
      'Payagan ang “Install unknown apps” sa Settings → Apps → JDK-Go, saka bumalik para mag-install.';

  @override
  String get updateInstallCancelled => 'Kinansela ang pag-install';

  @override
  String get updateInstallCancelledMessage => 'Na-save ang package. Maaari mo itong i-install anumang oras.';

  @override
  String get updateInstallUnconfirmed => 'Hindi nakumpirma ang resulta ng pag-install';

  @override
  String get updateInstallUnconfirmedMessage =>
      'Na-save ang package. Suriin ang anumang system prompt, saka subukang muli o buksan ito gamit ang system installer.';

  @override
  String get updateSignatureMismatch => 'Hindi tugma ang mga lagda ng app';

  @override
  String get updateSignatureMismatchMessage =>
      'Iba ang lagda ng JDK-Go sa iyong telepono (karaniwang test build). I-uninstall ito bago i-install ang bersyong ito. Buburahin ng pag-uninstall ang iyong mga chat, Linux environment at mga setting.';

  @override
  String get updateWrongPackage => 'Hindi ito JDK package';

  @override
  String get updateWrongPackageMessage => 'Maling file ang na-download at nabura ito. Subukang muli mamaya.';

  @override
  String get updateDowngradeBlocked => 'Hindi mai-install ang mas lumang bersyon';

  @override
  String get updateDowngradeBlockedMessage => 'Mas bago ang JDK sa iyong telepono kaysa sa package na ito.';

  @override
  String get updateIncompatible => 'Hindi tugma sa telepono na ito';

  @override
  String get updateIncompatibleMessage =>
      'Hindi tugma sa iyong telepono ang kinakailangang bersyon ng Android o arkitektura ng processor ng package.';

  @override
  String get updatePackageCorrupt => 'Sira ang package';

  @override
  String get updatePackageCorruptMessage => 'Nabura ito. I-download muli.';

  @override
  String get updateInstallBlocked => 'Naharang ang pag-install';

  @override
  String get updateInstallBlockedMessage =>
      'Payagan ang pag-install sa system prompt, o mag-download mula sa pahina ng release.';

  @override
  String get updateInstallIncomplete => 'Hindi kumpleto ang pag-install';

  @override
  String get updateInstallIncompleteMessage => 'Subukang muli, o mag-download mula sa pahina ng release.';

  @override
  String updateBrowserOpenFailed(String host, String path) {
    return 'Hindi mabuksan ang iyong browser. Bisitahin nang manu-mano ang $host$path.';
  }

  @override
  String updateUpToDateVersion(String version) {
    return 'Napapanahon ka na: $version';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Kasalukuyan $version';
  }

  @override
  String get updateNewVersionFound => 'May bagong bersyon';

  @override
  String get updateReleaseNotes => 'Ano ang bago';

  @override
  String get updateNoReleaseNotes => 'Walang release notes para sa bersyong ito.';

  @override
  String get updateInstallKeepsData =>
      'Magsasara ang JDK-Go para mag-install. Mananatili ang iyong mga chat at setting.';

  @override
  String get updateNoCompatiblePackage => 'Walang package para sa telepono na ito';

  @override
  String get updateDownloading => 'Dina-download';

  @override
  String updateDownloadSource(String source) {
    return 'Sa pamamagitan ng $source';
  }

  @override
  String get updateDownloadInBackgroundNote => 'Magpapatuloy ang pag-download pagkatapos mong isara ang window na ito';

  @override
  String get updateVerifyingPackage => 'Bine-verify ang package…';

  @override
  String get updateVerifyingPackageNote => 'Sinusuri kung tugma ang file sa release';

  @override
  String get updateInstalling => 'Ini-install…';

  @override
  String get updateConfirmInstallNote => 'Kumpirmahin ang pag-install sa system prompt';

  @override
  String get updatePackageDownloaded => 'Na-download ang package';

  @override
  String get updateReadyToInstall => 'Na-verify at handa nang i-install.';

  @override
  String get updateAllowInstall => 'Payagan ang JDK-Go na mag-install ng mga app';

  @override
  String get updateAllowInstallMessage =>
      'I-on ang “Install unknown apps” sa system settings. Magpapatuloy ang pag-install pagbalik mo.';

  @override
  String get updateOpenReleasePage => 'Buksan ang pahina ng release';

  @override
  String get updateUpdateNow => 'I-update ngayon';

  @override
  String get updateSkipVersion => 'Laktawan ang bersyong ito';

  @override
  String get updateInstallWithSystem => 'I-install gamit ang system installer';

  @override
  String get updateSystemInstallerFailed => 'Hindi mabuksan ang system installer';

  @override
  String get updateStarProject => 'I-Star ito';

  @override
  String get updateCancelDownload => 'Kanselahin ang pag-download';

  @override
  String get updateDownloadInBackground => 'I-download sa background';

  @override
  String get updateVerifying => 'Bine-verify…';

  @override
  String get updateInstallingBusy => 'Ini-install…';

  @override
  String get updateOpenPermissionSettings => 'I-on';

  @override
  String updateNoAbiPackage(String abi) {
    return 'Wala pang $abi package para sa release na ito. Tingnan ang pahina ng release.';
  }

  @override
  String get updateNoPackage => 'Wala pang package para sa release na ito. Tingnan ang pahina ng release.';

  @override
  String updateDownloadingPercent(int percent) {
    return 'Dina-download $percent%';
  }

  @override
  String get usageStatsTitle => 'Magpadala ng anonymous na usage stats';

  @override
  String get usageStatsSection => 'Pagandahin ang JDK-Go';

  @override
  String get usageStatsFooter =>
      'Kinokontrol ng switch na ito ang sariling bilang ng paggamit, mga bersyon, gumawa at model ng telepono, at estadistika ng bersyon ng system ng dsh-go. Walang kasamang chat, file o account, at hindi nito kinokontrol ang estadistika ng Google ML Kit SDK.';

  @override
  String get usageNoticeBody => 'Walang chat o personal na impormasyon.\nMaaaring patayin anumang oras.';

  @override
  String get usageUpgradeNotice =>
      'Bago: anonymous na usage stats, para makatulong sa pagpapabuti ng JDK-Go.\nWalang chat o personal na impormasyon.';

  @override
  String get usageUpgradeLearn => 'Alamin pa';

  @override
  String get usageUpgradeOff => 'Patayin';

  @override
  String viewArtifactSaved(String value) {
    return 'Na-save sa $value';
  }

  @override
  String get viewDownloadFolder => 'Downloads/';

  @override
  String get viewArtifactNoPreview => 'Hindi ma-preview';

  @override
  String get viewArtifactNotText => 'Hindi text file';

  @override
  String get viewArtifactLarge => 'Malaking file';

  @override
  String get viewArtifactMissing => 'Hindi na available ang file na ito';

  @override
  String get viewArtifactNotFile => 'Hindi ito file';

  @override
  String get viewArtifactOpenFailed => 'Hindi mabuksan';

  @override
  String get viewArtifactMore => 'Higit pang mga aksyon';

  @override
  String get viewWorkspace => 'Workspace';

  @override
  String get viewArtifactEmpty => 'Walang laman na file';

  @override
  String viewArtifactLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count linya', one: '1 linya');
    return 'Malaking file. Ipinapakita ang unang $_temp0';
  }

  @override
  String viewArtifactRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hilera', one: '1 hilera');
    return 'Ipinapakita ang unang $_temp0';
  }

  @override
  String get viewArtifactColumns => 'Ipinapakita ang unang 200 column';

  @override
  String viewArtifactWorksheet(int value) {
    return 'Sheet $value';
  }

  @override
  String get viewArtifactEmptySheet => 'Walang laman na sheet';

  @override
  String get viewArtifactEmptyTable => 'Walang laman na talahanayan';

  @override
  String get viewArtifactConvertFailed => 'Hindi ma-convert';

  @override
  String get viewArtifactConverting => 'Kino-convert sa PDF…';

  @override
  String get viewArtifactImageFailed => 'Hindi maipakita ang larawang ito';

  @override
  String get viewArtifactPhoneOpen => 'Buksan sa isang app sa telepono na ito';

  @override
  String get viewArtifactPdfFailed => 'Hindi mabuksan ang PDF na ito. Subukan ang ibang app.';

  @override
  String viewArtifactPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count pahina', one: '1 pahina');
    return '$_temp0';
  }

  @override
  String viewArtifactPage(int value) {
    return 'Pahina $value';
  }

  @override
  String get viewBalanceInvalidKey => 'Di-wastong key. Hindi masuri ang balanse.';

  @override
  String get viewBalancePrefix => 'Balanse';

  @override
  String get viewBalanceLowSuffix => ' · Mababang balanse';

  @override
  String get viewBalanceUnavailableSuffix => ' · Hindi available ang mga tawag';

  @override
  String get viewBalanceTopUp => 'Mag-top up';

  @override
  String get viewBalanceTitle => 'Balanse ng DeepSeek';

  @override
  String get viewBalanceKeyRequired => 'Maglagay ng API key para masuri ang iyong balanse';

  @override
  String get viewBalanceKeyInvalid => 'Di-wastong API key. Hindi masuri ang balanse.';

  @override
  String viewBalancePaid(String value) {
    return 'Bayad $value';
  }

  @override
  String viewBalanceGranted(String value) {
    return 'Bonus $value';
  }

  @override
  String get viewBalanceLow => 'Mababang balanse';

  @override
  String get viewBalanceUnavailable => 'Hindi available ang mga tawag';

  @override
  String get viewBalanceChecking => 'Sinusuri ang balanse…';

  @override
  String get viewBalanceCheckFailed => 'Hindi masuri ang balanse ngayon';

  @override
  String get viewBalanceNoAlert => 'Naka-off';

  @override
  String get viewBalanceBannerHidden => 'Nakatago ang alerto sa balanse hanggang mag-restart ang JDK-Go';

  @override
  String get viewBalanceTurnOff => 'I-off';

  @override
  String viewBalanceBelow(String value) {
    return 'Mas mababa sa $value';
  }

  @override
  String get viewBalanceAlert => 'Alerto sa mababang balanse';

  @override
  String get viewBalanceThreshold => 'Threshold ng alerto';

  @override
  String get viewBalanceGoTopUp => 'Mag-top up';

  @override
  String viewBalanceRemaining(String value) {
    return '$value na lang ang natitira';
  }

  @override
  String get viewBalanceModelDisabled => 'Kulang ang balanse. Naka-disable ang model.';

  @override
  String get viewBalanceRestore => 'Mag-top up para magpatuloy';

  @override
  String get viewUiIncomplete => 'Binubuo pa ang view';

  @override
  String get viewUiInvalid => 'May error sa pag-format ang view na ito';

  @override
  String get viewUiResend => 'Hilinging ipadala muli';

  @override
  String viewChartUnit(String value) {
    return 'Yunit: $value';
  }

  @override
  String viewChartSeries(int value) {
    return 'Serye $value';
  }

  @override
  String get viewChartTotal => 'Kabuuan';

  @override
  String get viewChartBar => 'Bar chart';

  @override
  String get viewChartHorizontalBar => 'Pahalang na bar chart';

  @override
  String get viewChartLine => 'Line chart';

  @override
  String get viewChartDonut => 'Donut chart';

  @override
  String viewUiResendMessage(Object value) {
    return 'Hindi naipakita ang nakaraang dsh-ui view: $value. Ayusin ito at ipadala muli.';
  }

  @override
  String viewUiBytesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first byte', one: '1 byte');
    String _temp1 = intl.Intl.pluralLogic(second, locale: localeName, other: '$second byte', one: '1 byte');
    return 'Ang view ay $_temp0, lampas sa limitasyong $_temp1';
  }

  @override
  String get viewUiEmptyCode => 'Walang laman ang code block';

  @override
  String viewUiInvalidJson(String message) {
    return 'Di-wastong JSON ($message)';
  }

  @override
  String get viewUiJsonRepaired => 'Binalewala ang mga komento o trailing comma';

  @override
  String get viewUiExpectedObject => 'Inaasahan ang isang component object';

  @override
  String viewUiDepthLimit(int first, int second) {
    return 'Lampas ang lalim na $first sa limitasyong $second';
  }

  @override
  String get viewUiMissingType => 'Nawawala ang type';

  @override
  String viewUiUnknownComponent(String value) {
    return 'Hindi kilalang component na $value';
  }

  @override
  String viewUiAvailableTypes(String first, String second) {
    return '$first; mga available: $second';
  }

  @override
  String viewUiExpectedChildren(int limit) {
    return 'Inaasahan ang isang array ng 1 hanggang $limit component';
  }

  @override
  String viewUiHiddenItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pang item ang nakatago',
      one: '1 pang item ang nakatago',
    );
    return 'Pinutol: $_temp0';
  }

  @override
  String viewUiNodeLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first component', one: '1 component');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second item ay pinutol',
      one: '1 item ay pinutol',
    );
    return 'Lampas sa $_temp0; ang huling $_temp1';
  }

  @override
  String viewUiChildLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first item', one: '1 item');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second item ay pinutol',
      one: '1 item ay pinutol',
    );
    return 'Lampas sa $_temp0; ang huling $_temp1';
  }

  @override
  String get viewUiExpectedString => 'Inaasahan ang isang string';

  @override
  String viewUiTextLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first karakter', one: '1 karakter');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String get viewUiTextTruncated => 'Pinutol: masyadong mahaba ang teksto';

  @override
  String get viewUiExpectedFinite => 'Inaasahan ang isang may hangganang numero';

  @override
  String get viewUiYes => 'Oo';

  @override
  String get viewUiNo => 'Hindi';

  @override
  String get viewUiExpectedStringNumber => 'Inaasahan ang isang string o numero';

  @override
  String viewUiUnknownTone(String value) {
    return 'Hindi kilalang tone na $value, binalewala; mga available: good, warn, bad';
  }

  @override
  String viewUiUnknownChart(String value) {
    return 'Hindi kilalang chart na $value, iginuhit bilang mga bar; mga available: bar, hbar, line, donut';
  }

  @override
  String get viewUiExpectedCategories => 'Inaasahan ang isang hindi walang laman na array ng mga label';

  @override
  String viewUiCategoryLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first kategorya', one: '1 kategorya');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String viewUiFirstPoints(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit punto', one: '1 punto');
    return 'Ipinapakita lang ang unang $_temp0';
  }

  @override
  String viewUiExpectedSeries(String shape) {
    return 'Inaasahan ang isang hindi walang laman na array ng $shape object';
  }

  @override
  String get viewUiSkippedSeries => 'Inaasahan ang isang array ng mga numero; nilaktawan ang serye';

  @override
  String viewUiValuesCategories(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first halaga', one: '1 halaga');
    String _temp1 = intl.Intl.pluralLogic(second, locale: localeName, other: '$second kategorya', one: '1 kategorya');
    return '$_temp0 para sa $_temp1; inalis ang sobrang halaga, iniwang blangko ang nawawala';
  }

  @override
  String viewUiNonFiniteValues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hindi may hangganang halaga',
      one: '1 hindi may hangganang halaga',
    );
    return '$_temp0 ang iniwang blangko';
  }

  @override
  String get viewUiNoSeries => 'Walang seryeng iguguhit';

  @override
  String viewUiDonutSeries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pang serye ang binalewala',
      one: '1 pang serye ang binalewala',
    );
    return 'Isang serye lang ang ginagamit ng donut chart; $_temp0';
  }

  @override
  String get viewUiFirstSeries => 'Iginuguhit lang ang unang serye';

  @override
  String viewUiSeriesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first serye', one: '1 serye');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String viewUiFirstSeriesCount(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit serye', one: '1 serye');
    return 'Ipinapakita lang ang unang $_temp0';
  }

  @override
  String get viewUiNoFiniteValues => 'Walang may hangganang halaga';

  @override
  String viewUiTruncated(String value) {
    return 'Pinutol: $value';
  }

  @override
  String viewUiExpectedCompare(int limit, String shape) {
    return 'Inaasahan ang isang array ng 2 hanggang $limit $shape object';
  }

  @override
  String viewUiItemLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first item', one: '1 item');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String viewUiFirstItems(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit item', one: '1 item');
    return 'Ipinapakita lang ang unang $_temp0';
  }

  @override
  String viewUiSkippedCompare(String shape) {
    return 'Inaasahan ang $shape; nilaktawan ang item';
  }

  @override
  String get viewUiSkippedItemLabel => 'Inaasahan ang isang hindi walang laman na string; nilaktawan ang item';

  @override
  String viewUiRowLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first hilera', one: '1 hilera');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String get viewUiSkippedRow => 'Inaasahan ang [name, value]; nilaktawan ang hilera';

  @override
  String get viewUiNoItems => 'Walang item na iguguhit';

  @override
  String viewUiFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit hilera', one: '1 hilera');
    return 'Ipinapakita lang ang unang $_temp0 bawat item';
  }

  @override
  String viewUiExpectedSteps(String shape) {
    return 'Inaasahan ang isang hindi walang laman na array ng $shape object';
  }

  @override
  String viewUiStepLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first hakbang', one: '1 hakbang');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String viewUiFirstSteps(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit hakbang', one: '1 hakbang');
    return 'Pinutol: ipinapakita lang ang unang $_temp0';
  }

  @override
  String viewUiSkippedStep(String shape) {
    return 'Inaasahan ang $shape; nilaktawan ang hakbang';
  }

  @override
  String viewUiUnknownStatus(String value) {
    return 'Hindi kilalang status na $value, iginuhit bilang todo; mga available: done, current, todo, failed';
  }

  @override
  String get viewUiNoSteps => 'Walang hakbang na iguguhit';

  @override
  String viewUiUnknownCalloutTone(String value) {
    return 'Hindi kilalang tone na $value, iginuhit bilang info; mga available: info, good, warn, bad';
  }

  @override
  String viewUiExpectedOptions(int limit, String shape) {
    return 'Inaasahan ang isang array ng 1 hanggang $limit $shape na opsyon';
  }

  @override
  String viewUiOptionLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first opsyon', one: '1 opsyon');
    return '$_temp0, lampas sa limitasyong $second';
  }

  @override
  String viewUiFirstOptions(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit opsyon', one: '1 opsyon');
    return 'Pinutol: ipinapakita lang ang unang $_temp0';
  }

  @override
  String viewUiDuplicateLabel(String value) {
    return 'Duplicate na label na $value; nilaktawan';
  }

  @override
  String get viewUiNoOptions => 'Walang magagamit na opsyon';

  @override
  String viewUiSummaryBody(String value) {
    return '[View] $value';
  }

  @override
  String viewUiSummaryTitleBody(String first, String second) {
    return '[View] $first: $second';
  }

  @override
  String get viewUiSummaryInvalid => '[View] (error sa pag-format, hindi naipakita)';

  @override
  String viewUiSummaryText(String value) {
    return 'Teksto: $value';
  }

  @override
  String viewUiSummaryChart(String summary) {
    return 'Chart: $summary';
  }

  @override
  String viewUiSummaryCompare(String value) {
    return 'Paghambingin: $value';
  }

  @override
  String viewUiSummarySteps(String value) {
    return 'Mga hakbang: $value';
  }

  @override
  String viewUiSummaryCallout(String value) {
    return 'Tala: $value';
  }

  @override
  String viewUiSummaryOptions(String value) {
    return 'Mga opsyon: $value';
  }

  @override
  String viewUiSummaryConfirm(String first, String second) {
    return 'Kumpirmahin: $first/$second';
  }

  @override
  String viewUiReplyChoice(String value) {
    return 'Pumili: $value';
  }

  @override
  String viewUiReplyConfirm(String value) {
    return 'Kumpirmahin: $value';
  }

  @override
  String viewUiReplyCancel(String value) {
    return 'Kanselahin: $value';
  }

  @override
  String viewUiReplyOther(String value) {
    return 'Iba pa: $value';
  }

  @override
  String get viewUiFreeTextHint => 'Iba pa (mag-type ng sarili mo)';

  @override
  String viewUiChosenOther(String value) {
    return 'Isinulat: $value';
  }

  @override
  String viewUiChosen(String value) {
    return 'Napili: $value';
  }

  @override
  String get viewUiConfirmed => 'Kumpirmado';

  @override
  String viewUiConfirmedValue(String value) {
    return 'Kumpirmado: $value';
  }

  @override
  String viewUiCancelledValue(String value) {
    return 'Kinansela: $value';
  }

  @override
  String get viewUiReplied => 'Sumagot';

  @override
  String get viewUiGenerating => 'Binubuo ang view';

  @override
  String get viewUiReplyAfterEnd => 'Pumili kapag kumpleto na ang sagot';

  @override
  String get viewUiExpired => 'Nag-expire';

  @override
  String get viewUiNotStarted => 'Hindi pa nasimulan';

  @override
  String get viewUiMultiple => 'Pumili ng marami';

  @override
  String get viewSuggestWorkspace => 'Galugarin ang workspace';

  @override
  String get viewSuggestWorkspacePrompt =>
      'Tingnan kung anong mga file at proyekto ang nasa workspace at bigyan ako ng maikling pangkalahatang-ideya.';

  @override
  String get viewSuggestWordCount => 'Sumulat ng script';

  @override
  String get viewSuggestWordCountPrompt =>
      'Sumulat ng Python script na naghahanap ng 20 pinakamadalas na salita sa isang text file, saka patakbuhin ito at ipakita sa akin ang mga resulta.';

  @override
  String get viewSuggestNode => 'Bagong proyekto';

  @override
  String get viewSuggestNodePrompt =>
      'Lumikha ng Node.js na proyekto sa workspace na may TypeScript at isang minimal na unit test.';

  @override
  String get viewSuggestGit => 'Ipaliwanag ang Git';

  @override
  String get viewSuggestGitPrompt =>
      'Gumamit ng konkretong halimbawa para ipaliwanag ang pagkakaiba ng git rebase at git merge, at kailan gagamitin ang bawat isa.';

  @override
  String get viewSuggestWorkspaceHint => 'Ilista ang mga file at proyekto';

  @override
  String get viewSuggestWordCountHint => 'Bilangin ang mga salita, saka patakbuhin';

  @override
  String get viewSuggestNodeHint => 'Node.js na may mga test';

  @override
  String get viewSuggestGitHint => 'Rebase o merge?';

  @override
  String get viewTipNext => 'Susunod na tip';

  @override
  String viewTipLabel(String value) {
    return 'Tip: $value';
  }

  @override
  String get viewTipSteer => 'Habang gumagana ito, pindutin nang matagal ang Send para gabayan, ipila o putulin';

  @override
  String get viewTipMidRun => 'Maaari kang mag-message habang tumatakbo — babasahin nito sa susunod na hakbang';

  @override
  String get viewTipSlash => 'I-type ang / para sa mga command: i-compact ang context, magpalit ng model at iba pa';

  @override
  String get viewTipMention => 'I-type ang @ para mag-reference ng file sa workspace o ibang chat';

  @override
  String get viewTipReplyMenu => 'Pindutin nang matagal ang sagot para kopyahin, sipiin o buuin muli ito';

  @override
  String get viewTipEditResend =>
      'Pindutin nang matagal ang sarili mong mensahe para i-edit at ipadala muli — mananatili ang orihinal';

  @override
  String get viewTipQuote => 'Pumili ng bahagi ng sagot at i-tap ang Sipi para magtanong tungkol lang doon';

  @override
  String get viewTipTitleDetails => 'I-tap ang pamagat ng chat para sa mga pagbabago, file at terminal';

  @override
  String get viewTipContextRing =>
      'Ipinapakita ng singsing sa tabi ng Send ang paggamit ng context — i-tap ito para sa mga detalye';

  @override
  String get viewTipDrawerMenu =>
      'Pindutin nang matagal ang chat sa sidebar para i-pin, palitan ang pangalan o i-archive ito';

  @override
  String get viewTipSearch =>
      'Kung sinusuportahan ng host, tumutugma ang paghahanap ng chat sa nilalaman ng mensahe, hindi lang sa mga pamagat';

  @override
  String get viewTipSettingsSearch => 'Pindutin nang matagal ang Settings sa sidebar para maghanap ng mga setting';

  @override
  String get viewTipQuickPanel => 'Mag-swipe pakaliwa sa isang chat para buksan ang quick panel';

  @override
  String get viewTipFolderNewChat => 'Pindutin nang matagal ang folder sa sidebar para magsimula ng chat sa loob nito';

  @override
  String get viewTipSwitchHost =>
      'I-tap ang pangalan ng host sa ibaba ng sidebar para lumipat sa JDK sa iyong computer';

  @override
  String get viewTipPasteImage => 'Maaaring dumiretso sa composer ang mga screenshot at sticker mula sa iyong keyboard';

  @override
  String get viewTipLauncher =>
      'Pindutin nang matagal ang icon ng app para magtanong gamit ang boses o magsimula ng bagong chat';

  @override
  String get viewTipPetBubble => 'Kapag naglabas ng bubble ang pet, i-tap ito para tumalon sa chat na naghihintay';

  @override
  String get viewTipPetPlay =>
      'I-tap ang pet nang tatlong beses para kilitiin ito; pindutin nang matagal para palitan ito';

  @override
  String get viewTipActivityStrip =>
      'Habang gumagana ito, i-tap ang status strip para makita ang buong trace ng turn na ito';

  @override
  String get viewTipImageZoom =>
      'Sa image viewer, i-double-tap o i-pinch para mag-zoom; pindutin nang matagal para mag-save';

  @override
  String get viewTipQueuedRecall => 'Maaaring bawiin sa composer ang nakapilang mensahe para i-edit';

  @override
  String get viewTipKeyboard => 'Gamit ang keyboard: nagpapadala ang Ctrl+Enter, humihinto ang dalawang beses na Esc';

  @override
  String get viewTipShareIn =>
      'Magbahagi ng teksto o larawan sa JDK-Go mula sa ibang app para magsimula ng bagong chat kasama ang mga ito';

  @override
  String get viewTipShareSelect =>
      'Kapag nagbabahagi ng chat, pindutin nang matagal at i-slide para pumili ng maraming mensahe nang sabay';

  @override
  String get viewTipChartDrag => 'Mag-drag sa isang chart sa sagot para basahin ang bawat punto';

  @override
  String get viewTipCopyPath => 'Pindutin nang matagal ang file sa card ng mga pagbabago para kopyahin ang path nito';

  @override
  String get viewTipCompanion => 'Nasa Switch Host sheet ang Companion Room';

  @override
  String get viewTipAnswerInline => 'Kapag may itinanong ang AI, i-type lang ang sagot sa composer';

  @override
  String get viewTipWallpaper => 'Maaaring i-drag, i-zoom, i-blur at padilimin ang mga wallpaper';

  @override
  String get viewTipModelHere => 'Piliin ang model, preset at mga pahintulot dito mismo — para sa chat na ito lang';

  @override
  String get viewNewChatFolder => 'Folder';

  @override
  String get viewNewChatPresetTitle => 'Preset para sa chat na ito';

  @override
  String get viewNewChatPermissionTitle => 'Mga pahintulot para sa chat na ito';

  @override
  String get viewNewChatDefault => 'Default';

  @override
  String get viewNewChatUnavailable => 'Hindi available';

  @override
  String get viewNewChatChange => 'Baguhin';

  @override
  String get viewNewChatModesFailed => 'Hindi maitakda ang preset o mga pahintulot. Hindi naipadala ang mensahe.';

  @override
  String get viewGreetingMorning => 'Magandang umaga';

  @override
  String get viewGreetingNoon => 'Magandang hapon';

  @override
  String get viewGreetingAfternoon => 'Magandang hapon';

  @override
  String get viewGreetingEvening => 'Magandang gabi';

  @override
  String get viewGreetingNight => 'Gabi na';

  @override
  String get viewEmptySubtitle => 'Ano ang gusto mong gawin ngayon?';

  @override
  String get viewEmptyStarting => 'Sinisimulan ang engine…';

  @override
  String get viewEmptyConnecting => 'Kumokonekta sa engine…';

  @override
  String get viewEmptyDisconnected => 'Hindi nakakonekta ang engine';

  @override
  String get viewEmptyReconnect => 'Kumonekta muli';

  @override
  String viewEmptyWorkspace(String value) {
    return 'Sa “$value”';
  }

  @override
  String get viewEmptySwitchWorkspace => 'Lumipat ng workspace';

  @override
  String get viewEmptyHostDefaultDirectory => 'Default na folder ng host';

  @override
  String get viewScheduleTitle => 'Mga automation';

  @override
  String get viewScheduleRefreshFailed => 'Hindi ma-refresh';

  @override
  String get viewScheduleNone => 'Walang aktibong automation';

  @override
  String viewScheduleNext(String value) {
    return 'Susunod $value';
  }

  @override
  String get viewScheduleUntitled => 'Automation na walang pamagat';

  @override
  String get viewScheduleSendFailed => 'Hindi naipadala';

  @override
  String get viewScheduleEnded => 'Tapos na';

  @override
  String get viewScheduleUpcoming => 'Susunod';

  @override
  String get viewScheduleSending => 'Ipinapadala…';

  @override
  String get viewScheduleRunNow => 'Patakbuhin ngayon';

  @override
  String get viewScheduleManage => 'Pamahalaan';

  @override
  String viewScheduleToday(String value) {
    return 'Ngayon $value';
  }

  @override
  String viewScheduleTomorrow(String value) {
    return 'Bukas $value';
  }

  @override
  String viewScheduleYesterday(String value) {
    return 'Kahapon $value';
  }

  @override
  String viewScheduleWeekday(String first, String second) {
    return '$first $second';
  }

  @override
  String get viewScheduleDue => 'Kasalukuyang due';

  @override
  String viewScheduleDaysAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count araw', one: '1 araw');
    return 'Sa loob ng $_temp0';
  }

  @override
  String viewScheduleDaysOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count araw', one: '1 araw');
    return '$_temp0 nang overdue';
  }

  @override
  String viewScheduleSingleLabel(String title) {
    return 'Automation: $title';
  }

  @override
  String viewScheduleCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automation', one: '1 automation');
    return '$_temp0';
  }

  @override
  String get viewModelSelect => 'Pumili ng model';

  @override
  String get viewModelThinkingOff => 'Naka-off';

  @override
  String get viewModelThinkingMinimal => 'Minimal';

  @override
  String get viewModelThinkingLow => 'Mababa';

  @override
  String get viewModelThinkingMedium => 'Katamtaman';

  @override
  String get viewModelThinkingHigh => 'Mataas';

  @override
  String get viewModelThinkingMax => 'Max';

  @override
  String viewModelLabel(String value) {
    return 'Model: $value';
  }

  @override
  String viewModelEffortLabel(String value) {
    return 'Thinking effort $value';
  }

  @override
  String get viewModelLoadFailed => 'Hindi ma-load ang mga model';

  @override
  String get viewModelDisconnected => 'Hindi nakakonekta ang engine';

  @override
  String get viewModelConnectHint => 'Kumonekta para pumili ng model';

  @override
  String get viewModelEffort => 'Thinking effort';

  @override
  String get viewModelKeyRequired => 'Kailangan ng API key';

  @override
  String get viewModelProvidersHint => 'Sinusuportahan ang DeepSeek at ibang provider ng model';

  @override
  String get viewModelEnterKey => 'Ilagay ang API key';

  @override
  String get viewModelAddProvider => 'Magdagdag ng provider';

  @override
  String get viewModelNone => 'Walang available na model';

  @override
  String get viewModelKeyHint => 'Maaaring hindi aktibo o nag-expire na ang key';

  @override
  String get viewModelManageProviders => 'Pamahalaan ang mga provider';

  @override
  String get viewContinuePrompt => 'Ipagpatuloy ang chat na nakalakip dito:';

  @override
  String viewContinueRange(int first, int second, int third) {
    String _temp0 = intl.Intl.pluralLogic(third, locale: localeName, other: '$third turn', one: '1 turn');
    return 'Mga turn $first–$second sa $_temp0';
  }

  @override
  String viewContinueHeader(String value) {
    return '> Ibinahaging chat ng JDK-Go · $value\n';
  }

  @override
  String get viewContinueUser => '\n## User\n\n';

  @override
  String viewImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count larawan', one: '1 larawan');
    return '$_temp0';
  }

  @override
  String viewContinueAttachments(String value) {
    return '\n(Mga attachment: $value)\n';
  }

  @override
  String get viewContinueAssistant => '\n## Assistant\n\n';

  @override
  String get viewContinueInterrupted => '\n(Naantala ang sagot)\n';

  @override
  String get viewContinueFailed => '(Nabigo)';

  @override
  String get viewContinueDeclined => '(Tinanggihan)';

  @override
  String get viewContinueCancelled => '(Kinansela)';

  @override
  String get viewLinkWeek => '7 araw';

  @override
  String get viewLinkMonth => '30 araw';

  @override
  String get viewLinkForever => 'Magpakailanman';

  @override
  String get viewShareChat => 'Chat';

  @override
  String get viewShareNoPermission => 'Walang pahintulot sa storage. Hindi na-save.';

  @override
  String get viewShareOpenFailed => 'Hindi mabuksan ang share sheet';

  @override
  String get viewShareLinkFailed => 'Hindi malikha ang link. Subukang muli mamaya.';

  @override
  String viewShareLinkText(String first, String second) {
    return '“$first” · Chat ng JDK-Go\n$second';
  }

  @override
  String get viewShareEmpty => 'Wala pang nilalaman ang chat na ito';

  @override
  String viewShareMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count mensahe', one: '1 mensahe');
    return '$_temp0';
  }

  @override
  String viewShareToolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count tool call', one: '1 tool call');
    return '$_temp0';
  }

  @override
  String get viewShareFileHint => 'I-replay at ipagpatuloy sa JDK-Go';

  @override
  String get viewShareWebHint => 'Nabubuksan sa anumang browser, kahit offline';

  @override
  String get viewShareMarkdownHint => 'Payak na teksto, nababasa kahit saan';

  @override
  String get viewShareLinkHint => 'End-to-end encrypted. Hindi makikita ng server ang iyong nilalaman.';

  @override
  String get viewSharePreview => 'Preview';

  @override
  String get viewShareWhole => 'Buong chat';

  @override
  String get viewShareScopeReply => 'Ang sagot na ito';

  @override
  String get viewShareScopePicked => 'Napili';

  @override
  String get viewShareThinking => 'Pag-iisip';

  @override
  String get viewShareIncludeTools => 'Mga tool call';

  @override
  String get viewShareChatFile => 'Chat file';

  @override
  String get viewShareWebPage => 'Web page';

  @override
  String get viewShareLink => 'Link';

  @override
  String get viewShareAsImage => 'Larawan';

  @override
  String get viewShareAsFile => 'File';

  @override
  String get viewShareAsText => 'Teksto';

  @override
  String get viewShareRedacted => 'Nakatago ang mga lihim';

  @override
  String get viewShareAdjust => 'I-edit';

  @override
  String viewShareTooLarge(int value) {
    return 'Lampas $value MB. Pumili ng mas kaunting mensahe.';
  }

  @override
  String get viewShareCreateLink => 'Lumikha ng link';

  @override
  String get viewShareStop => 'Ihinto ang pagbabahagi';

  @override
  String get viewShareStopTitle => 'Ihinto ang pagbabahagi?';

  @override
  String get viewShareStopped => 'Itinigil ang pagbabahagi';

  @override
  String get viewQrCode => 'QR code';

  @override
  String viewShareTurn(int value) {
    return 'Turn $value';
  }

  @override
  String get viewReplayContinue => 'Ipagpatuloy ang chat';

  @override
  String viewReplayTurns(int first, int second) {
    return 'Mga turn $first–$second';
  }

  @override
  String viewReplaySeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 seg');
    return '$_temp0';
  }

  @override
  String viewReplayMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String get viewReplayFull => 'Buong chat';

  @override
  String get viewReplayPause => 'I-pause';

  @override
  String get viewReplayRestart => 'I-replay';

  @override
  String get viewReplayPlay => 'I-play';

  @override
  String viewReplaySpeed(int value) {
    return 'Bilis $value×';
  }

  @override
  String get viewTemplatePaper => 'Papel';

  @override
  String get viewTemplateGlass => 'Glass';

  @override
  String get viewTemplateCard => 'Card';

  @override
  String get viewShareProjectQr => 'QR code ng proyekto';

  @override
  String get viewShareBrandLine => 'JDK sa telepono mo · I-scan para makuha ito';

  @override
  String get viewShareBrandLineNoQr => 'JDK sa telepono mo';

  @override
  String viewShareSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hakbang', one: '1 hakbang');
    return '$_temp0';
  }

  @override
  String get viewShareWebSearch => 'Paghahanap sa web';

  @override
  String get viewShareOpenPage => 'Buksan ang web page';

  @override
  String get viewShareRunCommand => 'Patakbuhin ang command';

  @override
  String get viewShareReadFile => 'Tingnan ang file';

  @override
  String get viewShareEditFile => 'I-edit ang file';

  @override
  String get viewShareSubagent => 'Subagent';

  @override
  String get viewShareSkill => 'Gumamit ng skill';

  @override
  String get viewSharePresentFiles => 'Ipakita ang mga file';

  @override
  String get viewShareWorkflow => 'Workflow';

  @override
  String get viewSharePlugin => 'Tumawag ng plugin';

  @override
  String get viewShareStars => 'Mga star';

  @override
  String viewSharePluginTitle(String value) {
    return 'JDK plugin na “$value”';
  }

  @override
  String viewShareInstallCommand(String value) {
    return 'I-install: dsh plugin add $value';
  }

  @override
  String viewSharePhoneInstall(String value) {
    return 'I-install sa telepono mo: $value';
  }

  @override
  String get viewShareImages => 'Mga larawan';

  @override
  String get viewSharePickMessages => 'Pumili ng mga mensahe';

  @override
  String viewShareDoneCount(int count) {
    return 'Tapos na ($count)';
  }

  @override
  String get viewShareImageMarker => '[Larawan]';

  @override
  String viewShareImagesMarker(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count larawan', one: '1 larawan');
    return '[$_temp0]';
  }

  @override
  String get viewShareYou => 'Ikaw';

  @override
  String get viewShareImageFailed => 'Hindi malikha ang larawan. Subukang muli.';

  @override
  String get viewShareQuestion => 'Tanong';

  @override
  String get viewShareModelSteps => 'Model at mga hakbang';

  @override
  String get viewShareImagePreview => 'Preview ng larawan para sa pagbabahagi';

  @override
  String get viewShareSaveImage => 'I-save ang larawan';

  @override
  String viewScheduleHoursAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count oras', one: '1 oras');
    return 'Sa loob ng $_temp0';
  }

  @override
  String viewScheduleHoursOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count oras', one: '1 oras');
    return '$_temp0 nang overdue';
  }

  @override
  String viewScheduleMinutesAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return 'Sa loob ng $_temp0';
  }

  @override
  String viewScheduleMinutesOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0 nang overdue';
  }

  @override
  String viewScheduleSecondsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 seg');
    return 'Sa loob ng $_temp0';
  }

  @override
  String viewScheduleSecondsOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count seg', one: '1 seg');
    return '$_temp0 nang overdue';
  }

  @override
  String viewScheduleDate(String date, String clock) {
    return '$date $clock';
  }

  @override
  String viewScheduleYearDate(String year, String date, String clock) {
    return '$date, $year $clock';
  }

  @override
  String viewScheduleWeekdayName(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Lun',
      '2': 'Mar',
      '3': 'Miy',
      '4': 'Huw',
      '5': 'Biy',
      '6': 'Sab',
      'other': 'Lin',
    });
    return '$_temp0';
  }

  @override
  String viewReplayDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Ene',
      '2': 'Peb',
      '3': 'Mar',
      '4': 'Abr',
      '5': 'May',
      '6': 'Hun',
      '7': 'Hul',
      '8': 'Ago',
      '9': 'Set',
      '10': 'Okt',
      '11': 'Nob',
      '12': 'Dis',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String viewReplayHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count oras', one: '1 oras');
    return '$_temp0';
  }

  @override
  String viewReplayHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(hours, locale: localeName, other: '$hours oras', one: '1 oras');
    String _temp1 = intl.Intl.pluralLogic(minutes, locale: localeName, other: '$minutes min', one: '1 min');
    return '$_temp0 $_temp1';
  }

  @override
  String viewUiHundredMillion(String value) {
    return '${value}B';
  }

  @override
  String viewUiTenThousand(String value) {
    return '${value}K';
  }

  @override
  String viewUiMillion(String value) {
    return '${value}M';
  }

  @override
  String get viewListSeparator => ',';

  @override
  String get viewAttachmentSeparator => ',';

  @override
  String viewUiInvalidJsonOffset(String message, int offset) {
    return 'Di-wastong JSON ($message, malapit sa karakter $offset)';
  }

  @override
  String get viewUiUnavailableChart => 'Hindi maipakita ang chart';

  @override
  String get viewUiUnavailableMetric => 'Hindi maipakita ang metric';

  @override
  String get viewUiUnavailableCompare => 'Hindi maipakita ang paghahambing';

  @override
  String get viewUiUnavailableSteps => 'Hindi maipakita ang mga hakbang';

  @override
  String get viewUiUnavailableCallout => 'Hindi maipakita ang tala';

  @override
  String get viewUiUnavailableOptions => 'Hindi maipakita ang mga opsyon';

  @override
  String get viewUiUnavailableConfirm => 'Hindi maipakita ang kumpirmasyon';

  @override
  String get viewUiUnavailableText => 'Hindi maipakita ang teksto';

  @override
  String get viewUiUnavailableGroup => 'Hindi maipakita ang grupong ito';

  @override
  String get viewUiUnavailablePart => 'Hindi maipakita ang seksyong ito';

  @override
  String viewScheduleSingleNextLabel(String title, String when) {
    return 'Automation: $title, susunod $when';
  }

  @override
  String viewScheduleCountNextLabel(int count, String when) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automation', one: '1 automation');
    return '$_temp0, susunod $when';
  }

  @override
  String get viewUiSkippedStepLabel => 'Inaasahan ang isang string; nilaktawan ang hakbang';

  @override
  String viewLabeledValue(String label, String value) {
    return '$label: $value';
  }

  @override
  String viewDescribedValue(String label, String description) {
    return '$label, $description';
  }

  @override
  String get viewSemicolonSeparator => ';';

  @override
  String viewChartSemantics(String kind, String data) {
    return '$kind. $data';
  }

  @override
  String viewMetricSemantics(String label, String value) {
    return '$label $value';
  }

  @override
  String viewMetricCaptionSemantics(String label, String value, String caption) {
    return '$label $value, $caption';
  }

  @override
  String viewScheduleZone(String rule, String city, String offset) {
    return '$rule ($city · $offset)';
  }

  @override
  String viewContinueNotice(String text) {
    return '\n($text)\n';
  }

  @override
  String viewShareAltMarker(String alt) {
    return '[$alt]';
  }

  @override
  String get viewModelThinkingXhigh => 'Napakataas';

  @override
  String viewUiDialectWebOnly(String kind) {
    return '$kind · Tingnan sa JDK Web';
  }

  @override
  String get viewUiDialectKindInteractive => 'Interactive na bahagi';

  @override
  String get viewUiDialectKindChart => 'Chart';

  @override
  String get viewUiDialectKindDiagram => 'Diagram';

  @override
  String get viewUiDialectKindImage => 'Larawan';

  @override
  String get viewUiDialectKindAudio => 'Audio';

  @override
  String get viewUiDialectKindVideo => 'Video';

  @override
  String get viewUiDialectKindScene => '3D na eksena';

  @override
  String get viewUiDialectKindFiles => 'File tree';

  @override
  String get viewUiDialectKindMap => 'Mapa';

  @override
  String get viewUiDialectKindOther => 'Bahaging ito';

  @override
  String get viewUiDialectInvalid => 'Ipinapakita sa JDK Web ang block na ito';

  @override
  String get viewUiDialectNote => 'Ipinapakita sa JDK Web';

  @override
  String get voiceSettingsTitle => 'Voice input';

  @override
  String get voiceModeAuto => 'Awtomatiko';

  @override
  String get voiceModeSystem => 'System';

  @override
  String get voiceModeEngine => 'Voice model';

  @override
  String get voiceModeAutoHint => 'Gagamitin ang voice model kapag handa na, kung hindi ay ang serbisyo ng telepono';

  @override
  String get voiceModeSystemHint => 'Gamitin ang recognition service na napili sa teleponong ito';

  @override
  String get voiceModeEngineHint => 'Kinikilala ang pagsasalita gamit ang voice model ng engine';

  @override
  String get voiceFallbackStarted => 'Lumipat sa voice model. Magsalita muli.';

  @override
  String get voiceChooseSystem => 'Pumili ng speech recognition service sa system settings';

  @override
  String get voiceConfigureEngine => 'I-download muna ang voice model sa mga setting ng boses';

  @override
  String get voiceConfigureEither =>
      'Hindi available ang serbisyo ng telepono. I-download ang voice model sa mga setting ng boses.';

  @override
  String get voiceErrorNetworkTimeout => 'Nag-time out ang speech recognition. Suriin ang iyong koneksyon.';

  @override
  String get voiceErrorNetwork => 'Hindi nakakonekta sa network ang speech recognition';

  @override
  String get voiceErrorAudio => 'Nabigo ang pag-record ng audio. Suriin ang mikropono.';

  @override
  String get voiceErrorServer => 'Nabigo ang speech service ng system. Subukang muli mamaya.';

  @override
  String get voiceErrorClient => 'Hindi masimulan ang system recognition. Suriin ang speech service.';

  @override
  String get voiceErrorSpeechTimeout => 'Walang natukoy na pagsasalita. Magsalita muli.';

  @override
  String get voiceErrorNoMatch => 'Hindi narinig nang malinaw. Subukang muli.';

  @override
  String get voiceErrorBusy => 'Abala ang speech service ng system. Subukang muli mamaya.';

  @override
  String get voiceErrorPermission => 'Kailangan ng voice input ang access sa mikropono';

  @override
  String get voiceErrorTooManyRequests => 'Masyadong maraming kahilingan sa pagsasalita. Subukang muli mamaya.';

  @override
  String get voiceErrorDisconnected => 'Nadiskonekta ang speech service ng system';

  @override
  String get voiceErrorLanguageUnsupported => 'Hindi sinusuportahan ng system recognition ang wikang ito';

  @override
  String get voiceErrorLanguageUnavailable => 'I-download muna ang wikang ito sa speech service';

  @override
  String get voiceErrorSupportCheck => 'Hindi masuri ng speech service ang suporta sa recognition';

  @override
  String get voiceErrorDownloadEvents => 'Hindi maiulat ng speech service ang progreso ng pag-download ng model';

  @override
  String voiceErrorUnknown(int code) {
    return 'Error sa speech service $code. Subukan ang ibang recognition service.';
  }

  @override
  String get voiceSettingsFailed => 'Hindi mabasa ang mga setting ng pagsasalita. Subukang muli.';

  @override
  String get voiceModeSection => 'Recognition';

  @override
  String get voiceModelSection => 'Voice model';

  @override
  String get voiceModelFooter =>
      'Kapag na-download na, makikilala sa telepono ang Chinese, English, Cantonese, Japanese at Korean; nananatili sa telepono ang mga recording.';

  @override
  String get voiceModelWaiting => 'Available kapag tumatakbo na ang engine';

  @override
  String get voiceModelUnsupported => 'Walang voice model ang engine na ito';

  @override
  String get voiceModelAbsent => 'Hindi pa na-download';

  @override
  String get voiceModelDownloading => 'Dina-download';

  @override
  String get voiceModelPreparing => 'Sinusuri at nilo-load';

  @override
  String get voiceModelReady => 'Handa na';

  @override
  String get voiceModelFailed => 'Nabigo ang pag-download';

  @override
  String voiceModelBytes(String done, String total) {
    return '$done sa $total';
  }

  @override
  String voiceModelReadyNote(String size) {
    return 'Gumagamit ng $size; gumagana offline';
  }

  @override
  String voiceModelAbsentNote(String size) {
    return 'Humigit-kumulang $size ang ida-download';
  }

  @override
  String get voiceModelWaitingNote => 'Magsisimula ang pag-download kapag tumatakbo na ang engine';

  @override
  String get voiceModelFailNetwork => 'Hindi maabot ang pinagmumulan ng download';

  @override
  String get voiceModelFailTimeout => 'Tumigil sa pag-usad ang pag-download';

  @override
  String get voiceModelFailCertificate => 'Nabigo ang secure na koneksyon; suriin ang petsa ng telepono';

  @override
  String get voiceModelFailServer => 'Hindi available sa ngayon ang pinagmumulan ng download';

  @override
  String get voiceModelFailIntegrity => 'Hindi pumasa sa verification ang mga file';

  @override
  String voiceModelFailStorage(String size) {
    return 'Kulang ang storage; humigit-kumulang $size pa ang kailangan';
  }

  @override
  String get voiceModelFailEngine => 'Hindi tumugon ang engine';

  @override
  String get voiceModelFailUnknown => 'Hindi natapos ang pag-download';

  @override
  String get voiceModelDownload => 'I-download';

  @override
  String get voiceModelResume => 'Ituloy';

  @override
  String get voiceModelRedownload => 'I-download muli';

  @override
  String get voiceModelMeteredTitle => 'I-download gamit ang mobile data?';

  @override
  String voiceModelMeteredBody(String size) {
    return 'Humigit-kumulang $size ang voice model at gagamit ito ng mobile data.';
  }

  @override
  String get voiceModelDeleteTitle => 'Burahin ang voice model?';

  @override
  String get voiceModelDeleteBody =>
      'Gagamitin ng voice input ang serbisyo ng telepono. Maaari mong i-download muli ang model anumang oras.';

  @override
  String get voiceModelDeleteFailed => 'Hindi mabura ang voice model. Subukang muli.';

  @override
  String get voiceModelDeleteStopping => 'Humihinto pa ang pag-download. Burahin muli sa ilang sandali.';

  @override
  String voiceModelStartedToast(String size) {
    return 'Dina-download ang voice model · humigit-kumulang $size';
  }

  @override
  String voiceModelResumedToast(String size) {
    return 'Itinutuloy ang voice model · humigit-kumulang $size ang natitira';
  }

  @override
  String get voiceModelReadyToast => 'Handa na ang voice input';

  @override
  String voiceModelFailedToast(String reason) {
    return 'Nabigo ang pag-download ng voice model: $reason';
  }

  @override
  String voiceModelNoticeDownloading(int percent) {
    return 'Dina-download ang voice model $percent%';
  }

  @override
  String get voiceModelNoticePreparing => 'Sinusuri ang voice model';

  @override
  String get voiceModelNoticeFailed => 'Nabigo ang pag-download ng voice model. Buksan ang app para subukang muli.';

  @override
  String get voiceScribeReadFailed => 'Hindi mabasa ang mga setting ng boses. Subukang muli.';

  @override
  String get voiceScribeSavedReadFailed => 'Na-save. I-refresh para makita ang pinakabagong mga setting.';

  @override
  String get voiceScribeSaveUnconfirmed => 'Hindi makumpirma ang pag-save. I-refresh o subukang muli.';

  @override
  String get voiceScribeTitle => 'Mga setting ng boses';

  @override
  String get voiceScribePolishPrompt => 'Polish prompt';

  @override
  String get voiceScribeLanguage => 'Wika ng pagkilala';

  @override
  String get voiceScribeRefresh => 'I-refresh';

  @override
  String get voiceScribeHostChanged => 'Nagbago ang koneksyon. Buksan muli para magpatuloy.';

  @override
  String get voiceScribeUnsupported => 'Hindi available ang mga setting ng boses sa koneksyong ito.';

  @override
  String get voiceScribePluginDefault => 'Default';

  @override
  String get voiceScribeBuiltInPrompt => 'Built-in na prompt';

  @override
  String get voiceScribeProviders => 'Mga serbisyo ng pagkilala';

  @override
  String get voiceScribeKeySet => 'May key';

  @override
  String get voiceScribeNoKey => 'Walang key';

  @override
  String get voiceScribeHotwords => 'Mga hotword';

  @override
  String voiceScribeHotwordRules(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count patakaran', one: '1 patakaran');
    return '$_temp0';
  }

  @override
  String get wallpaperTitle => 'Wallpaper';

  @override
  String get wallpaperDefault => 'Default';

  @override
  String get wallpaperCustom => 'Custom';

  @override
  String get wallpaperFrame => 'Ilipat ang posisyon';

  @override
  String get wallpaperBlur => 'Blur';

  @override
  String get wallpaperLighten => 'Paliwanagin';

  @override
  String get wallpaperDim => 'Padilimin';

  @override
  String get wallpaperReplace => 'Palitan ang larawan';

  @override
  String get wallpaperPreview => 'Preview';

  @override
  String get wallpaperFooter =>
      'Makikita sa home, sa mga chat at sa drawer. Nalalapat ang Paliwanagin sa light mode, ang Padilimin sa dark mode; laging malinaw ang teksto. PNG, JPEG o WebP, hanggang 15 MB.';

  @override
  String get wallpaperChanged => 'Nagbago ang wallpaper';

  @override
  String get wallpaperTooLarge => 'Lampas 15 MB ang larawan';

  @override
  String get wallpaperUnsupported => 'Gumamit ng PNG, JPEG o WebP';

  @override
  String get wallpaperUnreadable => 'Hindi mabasa ang larawang ito';

  @override
  String get wallpaperUnavailable => 'Hindi mabuksan ang iyong mga larawan';

  @override
  String get wallpaperBroken => 'Hindi mabasa';

  @override
  String get wallpaperEditorHint => 'I-drag o i-pinch';

  @override
  String get wallpaperEditorReset => 'I-reset';

  @override
  String get wallpaperSampleTitle => 'Isang weekend sa tabing-dagat';

  @override
  String get wallpaperSampleStatus => 'Ngayon lang';

  @override
  String get wallpaperSampleQuestion => 'Magandang araw ba ang Sabado para sa beach?';

  @override
  String get wallpaperSampleAnswer =>
      'Oo. Maaraw ang Sabado ng hapon na may banayad na simoy at mga alon na wala pang kalahating metro, ang pinakamagandang araw ngayong linggo.';

  @override
  String get wallpaperSampleNote => 'Mabilis lumamig sa gabi, kaya magdala ng manipis na jacket.';

  @override
  String get wallpaperSampleTool => 'Sinuri ang 3 pinagmumulan ng panahon';

  @override
  String get searchKwWallpaper =>
      'background,larawan sa background,background ng chat,custom na background,backdrop,blur,litrato,wallpaper';

  @override
  String get webTitle => 'JDK Web';

  @override
  String get webSshAppOnly => 'Sa app lang nabubuksan ang mga link ng SSH tunnel';

  @override
  String get webRelayUnavailable =>
      'Hindi available ang JDK Web sa pamamagitan ng JDK Remote. Buksan ito sa computer na iyon.';

  @override
  String get webSshHost => 'SSH host';

  @override
  String get webLocalAppOnly => 'May launch token ang link ng telepono na ito at sa app lang ito nabubuksan';

  @override
  String get webEngineStatus => 'Katayuan ng engine';

  @override
  String get webEngineStarting => 'Sinisimulan ang engine';

  @override
  String get webEngineStartFailed => 'Hindi masimulan ang engine';

  @override
  String get webEngineNotRunning => 'Hindi tumatakbo ang engine';

  @override
  String get webEngineProblem => 'Nagka-problema ang engine';

  @override
  String get webStartingSoon => 'Magiging handa na ang JDK Web sa ilang sandali';

  @override
  String get webStartToOpen => 'Simulan ang engine ng teleponong ito para mabuksan ang JDK Web';

  @override
  String get webRestart => 'I-restart';

  @override
  String get webStartEngine => 'Simulan ang engine';

  @override
  String get webSwitchToWeb => 'Lumipat sa Web';

  @override
  String get webNativeFeatures => 'Mga native na feature';

  @override
  String get webSwitchToNative => 'Lumipat sa native';

  @override
  String get webAppSettings => 'Mga setting ng app';

  @override
  String get webSwitchHost => 'Lumipat ng host';

  @override
  String get webAttachmentTooLarge => 'Masyadong malaki ang attachment para sa JDK Web';

  @override
  String get webTextCopied => 'Nakopya ang teksto. I-paste ito sa input box.';

  @override
  String get webAttachmentFailed => 'Hindi makapagdagdag ng mga attachment sa JDK Web';

  @override
  String get webHostUnavailable => 'Hindi available ang JDK Web sa host na ito';

  @override
  String get webChatGone => 'Wala na ang chat na ito';

  @override
  String get webPageClosed => 'Nagsara ang pahina';

  @override
  String get webChatsWorkspaces => 'Mga chat at workspace';

  @override
  String get webRefresh => 'I-refresh';

  @override
  String get webOpenInBrowser => 'Buksan sa browser';

  @override
  String get webBrowserUnavailable => 'Hindi mabuksan sa browser';

  @override
  String get webReopen => 'Buksan muli';

  @override
  String get webPageNotOpened => 'Hindi mabuksan ang pahina';

  @override
  String get webCheckConnection => 'Suriin ang iyong network o katayuan ng engine at subukang muli';

  @override
  String get webTargetSessionMissing => 'Hindi mahanap ang chat na ito sa JDK Web. Nasa home page ka.';

  @override
  String get webTargetNotLoaded => 'Hindi pa tapos mag-load ang JDK Web';

  @override
  String get webTargetSettingsMissing =>
      'Hindi mahanap ang mga setting na ito. Maaaring kailangan mong mag-sign in o i-enable ang plugin.';

  @override
  String get webTargetPluginMissing => 'Hindi mahanap ang plugin na ito. Maaaring wala ito sa profile na ito.';

  @override
  String get webTargetSidebarFailed =>
      'Hindi mabuksan ang sidebar. Buksan ang chat na ito sa JDK Web at subukang muli.';

  @override
  String get webTargetCordisMissing => 'Hindi mahanap ang Cordis panel. Maaaring naalis na ang plugin.';

  @override
  String get webTargetNewChatFailed => 'Hindi makapagsimula ng chat. Nasa home page ka ng JDK Web.';

  @override
  String get webTargetPageFailed => 'Hindi mabuksan ang pahinang ito. Nasa home page ka ng JDK Web.';

  @override
  String webConnectHostFirst(String name) {
    return 'Kumonekta sa “$name” para mabuksan ang JDK Web';
  }

  @override
  String get workspaceRecoveryTitle => 'Pagbawi ng workspace index';

  @override
  String get workspaceRecoveryEnable => 'Gumamit ng recovery workspace index';

  @override
  String get workspaceRecoveryDisable => 'Gamitin muli ang orihinal na index';

  @override
  String get workspaceRecoveryHint =>
      'Sa telepono na ito lang: gumamit ng hiwalay na index para ma-access ang mga nababasang usapan kapag nabigo ang orihinal na workspace index.';

  @override
  String get workspaceRecoveryActive =>
      'Napili ang hiwalay na recovery index. Pareho ang orihinal at recovery index ay pinananatili.';

  @override
  String get workspaceRecoveryWorking => 'Gumagana…';

  @override
  String get workspaceRecoveryEnableBody =>
      'Titigil ang lokal na engine, lilipat sa hiwalay na recovery index, at magsisimula muli. Hindi gagalawin ang orihinal na workspace index. Hindi buburahin ang mga file ng usapan, plugin at kredensyal.\n\nSa unang paggamit, bubuuin ang bagong index mula sa mga nababasang usapan na umiiral pa ang mga folder. Hindi awtomatikong minamana ang mga lumang pangalan ng workspace, pagkakasunod-sunod, default, archived na estado at pin. Maaaring hindi lumabas ang mga walang laman na workspace at mga usapang nawawala ang folder. Pinananatili ang orihinal na lokal na pagpapangkat at mga kagustuhan sa pin.\n\nPinananatili ang recovery index at gagamitin muli sa susunod na i-enable mo ito. Nilalampasan nito ang pagkabigo ng orihinal na index; hindi nito inaayos ang orihinal na index.';

  @override
  String get workspaceRecoveryDisableBody =>
      'Titigil ang lokal na engine, babalik sa orihinal na workspace index, at magsisimula muli. Maaaring bumalik ang orihinal na pagkabigo.\n\nPinananatili ang parehong mga file ng usapang nalikha habang nagre-recover at ang recovery index. Hindi nagsi-sync ang membership at pagkakasunod-sunod ng workspace sa pagitan ng dalawang index. Maaaring hindi lumabas sa orihinal na index ang ilang usapang nalikha habang nagre-recover. I-enable muli ang recovery index para ipagpatuloy ang paggamit nito.';

  @override
  String get workspaceRecoveryEnableStart => 'I-enable at i-restart';

  @override
  String get workspaceRecoveryDisableStart => 'Gamitin ang orihinal at i-restart';

  @override
  String get workspaceRecoveryUnavailable =>
      'Hindi sinusuportahan ng bersyong ito ang pagbawi ng workspace index. Suriin ang katayuan ng lokal na engine at i-update ang app.';

  @override
  String get workspaceRecoveryRestartIncomplete =>
      'Nagbago ang index mode, ngunit hindi pa nakumpirmang huminto o nag-restart ang engine. Hintayin itong huminto bago ito simulan muli.';

  @override
  String get workspaceRecoverySaveFailed =>
      'Hindi ma-save ang index mode. Walang bagong pagsisimula na hiniling. Suriin ang katayuan at mga log ng lokal na engine.';

  @override
  String get workspaceRecoveryFailed =>
      'Hindi natapos ang operasyon. Suriin ang katayuan at mga log ng lokal na engine. Ipinapakita ng pahinang ito kung nagbago ang index mode.';
}
