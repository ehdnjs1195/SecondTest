package apitest;

public class MovieDto {
	private String movieSeq;
	private String title;
	private String titleEng;
	private String genrn;
	private String directorNm;
	private String actorNm;
	private String plot;
	private String runtime;
	private String repRlsDate;
	private String keywords;
	private String posters;
	public MovieDto() {}
	public MovieDto(String movieSeq, String title, String titleEng, String genrn, String directorNm, String actorNm,
			String plot, String runtime, String repRlsDate, String keywords, String posters) {
		super();
		this.movieSeq = movieSeq;
		this.title = title;
		this.titleEng = titleEng;
		this.genrn = genrn;
		this.directorNm = directorNm;
		this.actorNm = actorNm;
		this.plot = plot;
		this.runtime = runtime;
		this.repRlsDate = repRlsDate;
		this.keywords = keywords;
		this.posters = posters;
	}
	public String getMovieSeq() {
		return movieSeq;
	}
	public void setMovieSeq(String movieSeq) {
		this.movieSeq = movieSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleEng() {
		return titleEng;
	}
	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
	}
	public String getGenrn() {
		return genrn;
	}
	public void setGenrn(String genrn) {
		this.genrn = genrn;
	}
	public String getDirectorNm() {
		return directorNm;
	}
	public void setDirectorNm(String directorNm) {
		this.directorNm = directorNm;
	}
	public String getActorNm() {
		return actorNm;
	}
	public void setActorNm(String actorNm) {
		this.actorNm = actorNm;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getRepRlsDate() {
		return repRlsDate;
	}
	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getPosters() {
		return posters;
	}
	public void setPosters(String posters) {
		this.posters = posters;
	}
	
	
	
}
