<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-xcgl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlFujian-info.jlFujian-info.input.title" text="现场协调" /></title>
<%@include file="/common/s.jsp"%>

<script type="text/javascript">

$(function() {
	loadContent();
});

function loadContent(){
	$.ajax({
		url: '../../jl/jlShizhong-info-docTemplate-ajax.do',
		data: {
			'fszleix': 'JL_SZ_XCXTCONTENT',
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		//dataType:'json',
		async:false,
		success: function(data) {
			$('.content').html(data);
		}
	}); 
}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10"
			style='text-justify-trim:punctuation;font-family: 宋体;'>
			<article class="m-widget"  style="margin-left: auto;margin-right: auto;width: 90%">
				<header class="header">
				代码:JL_SZ_XCXTCONTENT
				</header>
				<div class="content content-inner" >
			<!-- 		<div class=WordSection1 style='layout-grid:15.6pt'>
						<h1 align="center" style='text-align:center'>
							<span style='font-size:18.0pt'>监理项目的组织协调工作</span>
						</h1>
						<p>
							<span style='font-size:15.0pt'>
								组织协调是监理工作的一项重要任务，适度协调可以使各种意见统一，使各方矛盾向有利的方向转化，从而使监理项目的实施、运行顺利，是监理工作成败的关键。</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> 一、<strong><span
									style='font-family:宋体'>监理项目组织协调的目的和内容</span></strong>
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>1</span>、监理项目组织协调的目的：监理项目的总<span
								lang=EN-US><a href="http://www.jianshe99.com/jianli/"
									target="_blank" title=监理工程师><span lang=EN-US
										style='color:windowtext'><span lang=EN-US>监理工程师</span></span></a></span>，采用相应的组织形式、手段和方法，对监理过程中产生的各种关系进行疏导，对产生的干扰和障碍予以排除，以便理顺各种关系，使监理的全过程处于良好、顺畅的运行状态，其目的是排除障碍，解决矛盾，处理争端，实现所监理的项目质量好、投资省、工期短，确保监理总目标的实现。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>2</span>、监理项目组织协调的内容：监理项目的组织协调，主要是协调参建各方与工程建设有关单位或人员的人际关系，组织机构之间的关系，供求关系、协作关系、法律关系以及其它可能发生的关系。需要协调的关系涉及面广，层次多，关系繁杂；协调起来最棘手，困难多，扯皮多，不确定因素多，而且在监理运行过程中，不同时期又有不同的表现，这些问题都需要通过协调来解决。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> 二、<strong><span
									style='font-family:宋体'>监理机构内部的组织协调</span></strong></span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>1</span>、总监要率先垂范，以身作则。总监是监理项目的带头人，总监真心诚意的与监理人员交朋友，尊重他们，关心他们，爱护他们，对于全体监理人员就有号召力；总监的实干精神，敬业精神，团结精神，奉献精神，为大家作出了榜样，就会影响监理人员的思想和行为：总监技术全面，经验丰富，工作能力强，以人格魅力把大家团结在你的身边，跟你一道工作。大家感到跟你干，能学到东西，能干好工作，有信心，有奔头。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>2</span>、监理机构的内部人际关系协调
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								人员的安排要量才用人。对每位监理人员，要根据专长进行安排，做到人尽其才、才尽其用；人才要合理匹配，扬长避短，做到能力互补、性格互补，充分发挥所有人员的积极性。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								工作委任上要职责分明。每个监理岗位，都应明确责任、目标和岗位职责，做到事事有人管，人人有专责，职责不重不漏。 </span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								工作的绩效评价上，要实事求是。评价每位监理人员的绩效要实事求是，工作成绩的取得，不仅需要主观努力，而且需要同志们的相互配合，需要一定的工作条件。谁都希望自已做出成绩，受到组织的肯定，评价恰当以免无功自傲和有功受屈。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								调解矛盾要恰到妤处。调解矛盾要不计恩怨，要顾全大局，要尊重当事人，平等待人；不要恃强凌弱，以“权”压人，要有理有据，有章有法，有的放矢；要采取主动、宽容、友善的态度，通过及时沟通、个别谈话、会议和必要的批评等灵活的方式方法，使全体监理人员处于团结、和谐、热情高涨的气氛中工作。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>3</span>、监理机构内部协调要做到巧分工、细安排、制度严。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								分工。监理项目的总监，要根据工作的特点，根据每位监理人员的专业技术，工作经验，监理素质，性格特点，工作特点，进行巧分工。巡视、旁站、计量、检验和<span
								lang=EN-US><a href="http://www.jianshe99.com/web/zhidao/"
									target="_blank" title=资料><span lang=EN-US
										style='color:windowtext'><span lang=EN-US>资料</span></span></a></span>管理等工作，做到任务到人，责任到人。大中型监理项目的总监，主要是对各监理部的合理组合，做到扬长避短，能力互补，性格互补，使每个监理部都能志同道合，思想统一，彼此间都有合作的愿望和诚意，充分发挥组织中每个监理人员的主动性、积极性和潜能，就可以创造出难以想象的惊人奇迹。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								细安排。要明确各监理部之间的相互关系。在监理过程中，有许多工作不是一个人或一个监理部可以完成的，监理工作的完成，要靠分工合作，其中有主办、有牵头、有协作、有配合之分。总监要根据监理规划和各专业组的专业特点，事先约定各个组之间的相互关系，不致出现误事、脱节等耽误工作。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								制度严。监理项目机构除了贯彻公司的各项管理制度外，总监还应根据本工程的特点，本监理机构的组织和人员情况，制订具体的、有针对性的、行之有效的管理制度。严格执行制度，做到不偏不倚、始终如一，不手软，不留情。避免工作中扯皮，越级和指令冲突；避免工作无序和混乱，树立实事求是、清正廉洁的工作作风和纪律，保证监理工作的<span
								lang=EN-US><a
									href="http://www.jianshe99.com/web/zhuanyeziliao/biaozhunguifan/"
									target="_blank" title=规范><span lang=EN-US
										style='color:windowtext'><span lang=EN-US>规范</span></span></a></span>化。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> 三、<strong><span
									style='font-family:宋体'>协调好工程参建各方的关系</span></strong></span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>1</span>、业主与施工单位的协调。业主与施工单位的关系贯穿于工程建设的全过程，工作往来频繁，对一些具体问题产生意见分歧是常有的事。双方除了共同履行好合同责任外，还应加强协作，施工单位要向监理单位、建设单位及时的提供项目管理规划、生产计划、技术措施、统计资料、工程事故报告等。建设单位除了抓资金的落实外，应按时向施工单位提供地质资料、设计图纸等有关资料，积极配合施工单位解决问题，排除障碍。监理应鼓励施工单位，将工程实施状况、实施结果、遇到困难及时向监理反映，以寻找监理过程中可能出现的干扰。双方联系的越紧，了解的越深，监理中的对抗和争执就越少。对招标、施工准备、施工过程、竣工验收等不同阶段的变化，采用不同的方式方法，本着充分协商的原则，耐心细致地协凋处理好各种矛盾。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>2</span>、勘察设计单位的协调，主要是地基处理、设计交底、图纸会审、修改设计、工程概算、隐蔽工程、竣工验收环节上要密切配合。如设计遗漏、图纸差错等问题，要解决在施工前；施工阶段严格按图施工；结构工程、专业工程、竣工验收要请设计单位参加。若发生质量事故，要听取设计单位的处理意见；施工中发现设计问题，监理应及时的报告业主，要求设计单位修改，以免造成大的损失；若监理单位掌握比原设计更先进的新技术、新<span
								lang=EN-US><a
									href="http://www.jianshe99.com/web/zhuanyeziliao/gongyi/"
									target="_blank" title=工艺><span lang=EN-US
										style='color:windowtext'><span lang=EN-US>工艺</span></span></a></span>、新材料，新结构、新设备时，要主动向业主推荐，支持设计单位技术创新。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>3</span>、设备、材料供应单位的协调，要充分依靠供应合同，运用竞争机制，价格机制，供求机制搞好协作配合，还要充分发挥企业法人的社会地位和作用。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <strong><span
									style='font-family:宋体'>四、协调好工程外部与工程建设的关系</span></strong>
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>1</span>、严格守法。“法”是代表国家利益和政府意图的，是项目建设与政府部门（如建设、文物、环保、消防等部门）关系的依据。与工程建设有关的法律、法规和<span
								lang=EN-US><a href="http://www.jianshe99.com/web/fagui/"
									target="_blank" title=规章><span lang=EN-US
										style='color:windowtext'><span lang=EN-US>规章</span></span></a></span>很多，监理首先要学法、懂法，还要守法、执法，用法指导建设，保护自已，解决监理过程中的问题。
							</span>
						</p>
						<p style='text-indent:30.0pt'>
							<span lang=EN-US style='font-size:15.0pt'>2</span><span
								style='font-size:15.0pt'>、遵守公共道德。工程建设具有露天性、社会性、长久性，很多方面都涉及公共利益。监理不仅要用公共道德约束自己，而且应当监督参建各方遵守公共道德，使矛盾在公共道德的标准下解决，争取社会各界对工程建设的关心和支持，争取良好社会环境。协调与工程建设相关单位的关系时，主要是运用请示、报告、汇报、送审、取证、说明等协调方法和信息沟通手段。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <b> 五<strong><span
										style='font-family:宋体'>、组织协调中应注意的几个问题</span></strong></b></span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>1</span>、公平、公正是协调的原则，必须坚持。公平、公正是指协调过程中要坚持中立，中立能增加协调工作的成功率。要中立，监理人员就要严格遵守监理的职业道德，克制自身不违规；在行为举止上要保持中立和公正，与业主、承包商、勘察设计等单位的相关管理人员之间，既要形成良好的工作关系，又要保持一定距离。总监和监理人员都应站在公正、客观的立场上，依据有关的法律、法规、规范和承发包合同，要以科学分析的方法，不凭随意想法解决问题，正确的调解参建各方的矛盾；不看后台，不讲情面，不论亲疏，公正无私的处理工程建设过程中的人和事，做到一碗水端平，维护参建各方合理、合法的利益，使当事各方心服口服。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>2</span>、知情是做好协调的基础。知情，要了解和熟悉与监理有关各主要管理人员的性格、爱好、工作方式、方法等。知情，要及时了解和掌握有关各方当事人之间利益关系，做到心中有数，头脑清醒。知情，要借助信息的发布、信息接收，及时掌握和跟踪各方信息，应用正确的信息，在有限的时间内，有的放矢的协调好内外关系。知情，总监和监理人员对重大工程建设活动情况，进行严格监督和科学控制，认真分折各家的情况，搞清来龙去脉，不马虎从事；对出现的问题，要分析原因，对症下药，恰当的协调好各方关系。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>3</span>、正确的工作方法，是搞好协调的重要手段。组织协调的方法很多，如协调、对话、谈判、发文、督促、监督、召开会议、发布指示、修改计划、进行咨询、提出建议、交流信息等。协调要注意原则性、灵活性、针对性、群众性。原则性是指监理人员的清正廉洁、作风正派、办事公平、公正、讲求科学、坚持原则、严格监理；坚持按照国家有关的法律、法规、规范、标准，严格检查、验收，对于各方的违规行为不姑息，不迁就，一抓到底。灵活性是指工作方法上和为人处事方面，要因人、因事、因地而宜，根据实际情况随机应变，灵活应用协调的各种方法，切忌生搬硬套；在众多的矛盾中，要突出重点，分清主次，抓主要矛盾，关键问题解决了，其它问题便可以迎刃而解。针对性是指协调要有针对性、有目的。在协调前要对所了解和掌握的情况，进行分析、归纳，理清头绪，找准问题，做到有的放矢；在协调前要多设想几种情况，尽可能考虑到各方可能提出的问题，多准备几套解决方案，做到有备无患；在协调前要明确协调对象、协调主体、协调问题的性质，然后选择适用的手段，以提高协调效率。协调中拿不准、考虑不成熟的问题，不急于表态，协调争取做到有理、有利、有节。群众性是指协调过程中注意走群众路线，让大家献计献策、群策群力，激发群众的创造热情，充分发挥集体的智慧和力量，与各方同舟共济，解决问题战胜困难。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'> <span lang=EN-US>4</span>、协调好争议，是搞好协调的关键。建设项目参建单位多，矛盾多，争议多；关系复杂，障碍多，需要协调的问题多，解决好监理过程中各种争议和矛盾，是搞好协调的关键。这些争议有专业技术争议，权利、利益争议，建设目标争议，角色争议，过程争议，人与人、单位与单位之间的争议等等。有争议是正常的，监理人员可以通过争议的调查、协调暴露矛盾，发现问题，获得信息，通过积极的沟通达到统一，化解矛盾。协调工作要注意效果，当争议不影响大局，总监应采取策略，引导双方回避争议，互谦互让，加强合作，形成利益互补，化解争议；利益冲突，双方协调困难，可请双方领导出面裁决：如果争议对立性大，协商、调解不能解决，可由行政裁决或司法判决。当监理成为争议的对象时，要保持冷静，避免争吵，不要伤害感情，否则会给协调带来困难。所有的监理人员都要采用感情、语言、接待、用权等艺术，搞好协调；注意说话的方式方法，做到有利于协调的话多说，不利于协调的话不说、不传；多做说明，多做说服工作；关系到协调的问题，要多汇报。
							</span>
						</p>
						<p>
							<span style='font-size:15.0pt'>
								监理通过协调，使参建各方减少磨擦，消除对抗，树立整体思想和全局观念，最大限度地调动各方面的积极性、主动性，使大家能够协同作战，创造出“天时、地利、人和”的良好环境，确保监理的总目标顺利实现。</span>
						</p>
					</div> -->
				</div>
			</article>
		</section>
	</div>
</body>
</html>
