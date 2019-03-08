
package domain;

import java.util.List;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Endorser extends Actor {

	private Double				score;
	private List<Endorsement>	endorsements;


	@Valid
	@ManyToMany
	public List<Endorsement> getEndorsements() {
		return this.endorsements;
	}

	public void setEndorsements(final List<Endorsement> endorsments) {
		this.endorsements = endorsments;
	}

	@NotNull
	@Min(-1)
	@Max(1)
	public Double getScore() {
		return this.score;
	}

	public void setScore(final Double score) {
		this.score = score;
	}

}
