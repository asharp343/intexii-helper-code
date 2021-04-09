-- drop table MiscSample
-- drop table Images
-- drop table Quadrant_Cardinality
-- drop table CarbonDating
-- drop table HumanSample
-- drop table Area
-- drop table Artifact




CREATE TABLE [Area] (
  [AreaID] int identity(0,1) primary key,
  [Latitude_1] int not null,
  [Latitude_2] int not null,
  [NorS] varchar(5) not null,
  [Longitude_1] int not null,
  [Longitude_2] int not null,
  [EorW] varchar(5) not null,
);


CREATE TABLE [Quadrant_Cardinality] (
  [Quadrant_Cardinality_ID] int identity(0,1) primary key,
  [Cardinality] varchar(10) not null,
);

CREATE TABLE [Artifact] (
  [ArtifactID] int identity(0,1) primary key,
  [AreaID] int not null references Area,
  [Quadrant_Cardinality_ID] int not null references Quadrant_Cardinality,
  [DateFound] DateTime,
  [PreviouslySampled] bit,
  [BurialDepth] int,
  [Rack] int,
  [Bag] int,
  [BurialNumber] int not null,
);

CREATE TABLE [Images] (
  [ImageID] int identity(0,1) primary key,
  [ArtifactID] int not null references Artifact,
  [Image_Pointer] varchar(200),
);



CREATE TABLE [CarbonDating] (
  [C14Sample] int identity(0,1) primary key,
  [ArtifactID] int not null references Artifact,
  [TubeNumber] int,
  [SizeMl] int,
  [Foci] int,
  [Location] VarChar(200),
  [Questions] VarChar(300),
  [Conventional_14C_Age_BP] int,
  [Calibrated_95%_Calendar_Date_MAX] int,
  [Calibrated_95%_Calendar_Date_MIN] int,
  [Calibrated_95%_Calendar_Date_SPAN] int,
  [Calibrated_95%_Calendar_Date_AVG] int,
  [Category] VarChar(100),
  [LabNotes] VarChar(200),
);

CREATE TABLE [HumanSample] (
  [HumanID] int identity(0,1) primary key,
  [ArtifactID] int not null references Artifact,
  [GenderBody] VarChar(20),
  [GenderGiles] VarChar(20),
  [GE_FunctionTotal] float,
  [SouthToHead] int,
  [SouthToFeet] int,
  [EastToHead] int,
  [EastToFeet] int,
  [Description] VarChar(500),
  [LengthRemains] int,
  [CranialID] int,
  [BasilarSuture] VarChar(10),
  [VentralArc] int,
  [SubPubicAngle] int,
  [SciaticNotch] int,
  [PubicBone] int,
  [PreaurSulcus] int,
  [MedialIPRamus] int,
  [DorsalPitting] int,
  [ForemanMagnum] int,
  [FemurHead] float,
  [HumerusHead] float,
  [Osteophytosis] VarChar(10),
  [PubicSymphysis] VarChar(5),
  [BoneLength] float,
  [MedialClavicle] float,
  [IiacCrest] float,
  [FemurDiameter] float,
  [Humerus] float,
  [FemurLength] float,
  [HumerusLength] float,
  [TibiaLength] float,
  [Robust] int,
  [SupraorbitalRidges] int,
  [OrbitalEdge] int,
  [ParietalBossing] int,
  [Gonian] int,
  [NuchalCrest] int,
  [ZygomaticCrest] int,
  [CranialSuture] VarChar(10),
  [MaximumCranialLength] float,
  [MaximumCranialBreadth] float,
  [BasionBregmaHeight] float,
  [BasionNasion] float,
  [BasionProsthionLength] float,
  [BizygomaticDiameter] float,
  [NasionProsthion] float,
  [MaximumNasalBreadth] float,
  [InterorbitalBreadth] float,
  [ArtifactsDescription] VarChar(500),
  [HairColor] VarChar(50),
  [PreservationIndex] VarChar(50),
  [HairTaken] bit,
  [SoftTissueTaken] bit,
  [BoneTaken] bit,
  [ToothTaken] bit,
  [TextileTaken] bit,
  [DescriptionOfTaken] VarChar(500),
  [ArtifactFound] bit,
  [EstimatedAge] int,
  [AgeMethod] VarChar(100),
  [EstimateLivingStature] int,
  [ToothAttrition] VarChar(100),
  [ToothEruption] VarChar(50),
  [PathologyAnomalies] VarChar(500),
  [EpiphysealUnion] VarChar(20),
  [HeadDirection] VarChar(4),
);

CREATE TABLE [MiscSample] (
  [SampleID] int identity(0,1) primary key,
  [ArtifactID] int not null references Artifact,
  [HumanID] int not null references HumanSample,
  [Description] VarChar(500),
);