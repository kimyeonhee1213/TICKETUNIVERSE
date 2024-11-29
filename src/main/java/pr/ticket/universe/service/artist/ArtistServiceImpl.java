package pr.ticket.universe.service.artist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.artist.dao.ArtistDAO;

@Service
public class ArtistServiceImpl implements ArtistService {
	@Inject
	ArtistDAO artistDao;
}
