use BYU_Excavation

-- drop table Artifact
-- drop table Images
-- drop table CarbonDating
-- drop table BiologicalSample
-- drop table FieldBookEntry
-- drop table FieldBook
-- drop table Burial
-- drop table [Square]
-- drop table Area



CREATE TABLE [Area] (
  [AreaID] decimal identity(0,1) primary key,
  [Area] varchar(10) not null,
);

CREATE TABLE [Square] (
  [SquareID] decimal identity(0,1) primary key,
  [LowPairNS] decimal not null,
  [HighPairNS] decimal not null,
  [LowPairEW] decimal not null,
  [HighPairEW] decimal not null,
  [BurialLocationNS] VarChar(5) not null,
  [BurialLocationEW] VarChar(5) not null,
);

CREATE TABLE [Burial] (
  [BurialID] decimal identity(0,1) primary key,
  [SquareID] decimal not null references [Square],
  [AreaID] decimal not null references Area,
  [BurialNumber] decimal not null,
  [SouthToHead] decimal not null,
  [SouthToFeet] decimal not null,
  [WestToHead] decimal not null,
  [WestToFeet] type not null,
  [Length] decimal not null,
  [Depth] decimal not null,
  [PhotoTaken] bit not null,
  [BurialGoods] bit not null,
  [DateFound] DateTime,
  [ClusterNumber] VarChar(500),
  [SampleNumber] decimal,
  [Rack] VarChar(50),
  [Shelf] VarChar(50),
  [Bag] VarChar(50),
  [PreviouslySampled] bit,
  [SexBody] VarChar(20),
  [SexGiles] VarChar(20),
  [GE_FunctionTotal] decimal,
  [Description] VarChar(5000),
  [BasilarSuture] VarChar(10),
  [VentralArc] decimal,
  [SubPubicAngle] decimal,
  [SciaticNotch] decimal,
  [PubicBone] decimal,
  [PreaurSulcus] decimal,
  [MedialIPRamus] decimal,
  [DorsalPitting] decimal,
  [ForemanMagnum] decimal,
  [FemurHead] decimal,
  [HumerusHead] decimal,
  [Osteophytosis] VarChar(10),
  [PubicSymphysis] VarChar(5),
  [BoneLength] decimal,
  [MedialClavicle] decimal,
  [IliacCrest] decimal,
  [FemurDiameter] decimal,
  [Humerus] decimal,
  [FemurLength] decimal,
  [HumerusLength] decimal,
  [TibiaLength] decimal,
  [Robust] decimal,
  [SupraorbitalRidges] decimal,
  [OrbitEdge] decimal,
  [ParietalBossing] decimal,
  [Gonian] decimal,
  [NuchalCrest] decimal,
  [ZygomaticCrest] decimal,
  [CranialSuture] VarChar(100),
  [MaximumCranialLength] decimal,
  [MaximumCranialBreadth] decimal,
  [BasionBregmaHeight] decimal,
  [BasionNasion] decimal,
  [BasionProsthionLength] decimal,
  [BizygomaticDiameter] decimal,
  [NasionProsthion] decimal,
  [MaximumNasalBreadth] decimal,
  [DecimalerorbitalBreadth] decimal,
  [HairColor] VarChar(50),
  [PreservationIndex] VarChar(50),
  [HairTaken] bit,
  [SoftTissueTaken] bit,
  [BoneTaken] bit,
  [ToothTaken] bit,
  [TextileTaken] bit,
  [DescriptionOfTaken] VarChar(500),
  [ArtifactFound] bit,
  [EstimatedAge] VarChar(100),
  [AgeMethod] VarChar(100),
  [EstimateLivingStature] decimal,
  [ToothAttrition] VarChar(100),
  [ToothEruption] VarChar(50),
  [PathologyAnomalies] VarChar(500),
  [EpiphysealUnion] VarChar(20),
  [HeadDirection] VarChar(4),
  [BYUSample] bit,
  [BodyAnalysisYear] decimal,
  [SkullAtMagazine] bit,
  [PostcraniaAtMagazine] bit,
  [ToBeConfirmed] bit,
  [SkullTrauma] bit,
  [PostcraniaTrauma] bit,
  [CribiaOrbitala] bit,
  [PoroticHyperotosis] bit,
  [PoroticHyperotosisLocations] VarChar(200),
  [MetopicSuture] bit,
  [ButtonOsteoma] bit,
  [OsteologyUnknownComment] VarChar(200),
  [TMJ_OA] bit,
  [LinearHypoplasiaEnamel] bit,
  [AreaHillBurials] decimal,
  [Tomb] decimal,
  [BurialPreservation] VarChar(100),
  [BurialWrapping] VarChar(10),
  [BurialAdultChild] VarChar(10),
  [GenderCode] VarChar(10),
  [BurialGenderMethod] VarChar(50),
  [AgeCodeSingle] VarChar(10),
  [FaceBundle] VarChar(50),
  [DateOnSkull] DateTime,
);

CREATE TABLE [FieldBook] (
  [FieldBookID] decimal identity(0,1) primary key,
  [Name] VarChar(100) not null,
  [Description] VarChar(500),
);

CREATE TABLE [FieldBookEntry] (
  [FieldBookEntryID] decimal identity(0,1) primary key,
  [FieldBookID] decimal not null references FieldBook,
  [BurialID] decimal  not null references Burial,
  [PageNumber] VarChar(100) not null,
  [ExpertInitials] VarChar(100) not null,
  [CheckerInitials] VarChar(100) not null,
);

CREATE TABLE [BiologicalSample] (
  [BiologicalSampleID] decimal identity(0,1) primary key,
  [BurialID] decimal  not null references Burial,
  [Description] VarChar(500) not null,
  [SampleRack] VarChar(50) not null,
  [SampleBag] VarChar(50) not null,
  [PreviouslySampled] bit not null,
  [Initials] VarChar(100) not null,
);

CREATE TABLE [CarbonDating] (
  [CarbonDatingID] decimal identity(0,1) primary key,
  [BurialID] decimal not null references Burial,
  [TubeNumber] decimal,
  [SizeMl] decimal,
  [Foci] decimal,
  [Location] VarChar(200),
  [Questions] VarChar(300),
  [Conventional_14C_Age_BP] decimal,
  [Calibrated_95%_Calendar_Date_MAX] decimal,
  [Calibrated_95%_Calendar_Date_MIN] decimal,
  [Calibrated_95%_Calendar_Date_SPAN] decimal,
  [Calibrated_95%_Calendar_Date_AVG] decimal,
  [Category] VarChar(100),
  [LabNotes] VarChar(200),
);

CREATE TABLE [Images] (
  [ImageID] decimal identity(0,1) primary key,
  [BurialID] decimal not null references Burial,
  [Image_Podecimaler] VarChar(200) not null,
);

CREATE TABLE [Artifact] (
  [ArtifactID] decimal identity(0,1) primary key,
  [BurialID] decimal not null references Burial,
  [Description] VarChar(500) not null,
);

